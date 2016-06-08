require 'phraseapp-ruby/version'

module PhraseApp

  API_CLIENT_IDENTIFIER = "PhraseApp Ruby #{VERSION}"

  module RequestErrors
    class ErrorResponse
      attr_reader :message

      def initialize(http_response)
        hash = JSON.load(http_response.body)
        @message = hash['message']
      end

      alias_method :error, :message
    end

    class ValidationErrorResponse
      attr_reader :message
      attr_reader :errors

      def initialize(http_response)
        hash = JSON.load(http_response.body)
        @message = hash['message']
        @errors = hash['errors'].map { |error| ValidationErrorMessage.new(error) }
      end
    end

    class ValidationErrorMessage
      attr_reader :resource, :field, :message

      def initialize(error)
        @resource = error["resource"]
        @field = error["field"]
        @message = error["message"]
      end

      def to_s
        sprintf("\t[%s:%s] %s", resource, field, message)
      end
    end

    class RateLimitingError
      attr_reader :limit, :remaining, :reset

      def initialize(resp)
        @limit = resp["X-Rate-Limit-Limit"].to_i
        @remaining = resp["X-Rate-Limit-Remaining"].to_i
        @reset = Time.at(resp["X-Rate-Limit-Reset"].to_i)
      end

      def to_s
        sprintf("Rate limit exceeded: from %d requests %d are remaining (reset in %d seconds)", limit, remaining, reset)
      end
    end
  end

  def self.multipart(hash)
    hash.inject("") do |res, (k, v)|
      res << "--#{PhraseApp::MULTIPART_BOUNDARY}\r\n"
      res << "Content-Disposition: form-data; name=\"#{k}\"\r\n"
      # res << "Content-Type: #{headers["Content-Type"]}\r\n" if headers["Content-Type"]
      res << "\r\n"
      res << Array(v).join(',')
      res << "\r\n"
    end
  end

  def self.send_request_paginated(credentials, method, path_with_query, ctype, body, status, page, per_page)
    uri = URI.parse(path_with_query)

    hash = if uri.query then CGI::parse(uri.query) else {} end
    hash["page"] = page
    hash["per_page"] = per_page

    query_str = URI.encode_www_form(hash)
    path = [uri.path, query_str].compact.join('?')

    return send_request(credentials, method, path, ctype, body, status)
  end

  def self.send_request(credentials, method, path, ctype, data, status)
    req = Net::HTTPGenericRequest.new(method,
        Net::HTTP.const_get(method.capitalize).const_get(:REQUEST_HAS_BODY),
        Net::HTTP.const_get(method.capitalize).const_get(:RESPONSE_HAS_BODY),
        path)


    if credentials.debug
      puts "-------"
      puts "data:"
      puts data.inspect
    end

    req.body = data


    if ctype != ""
      req["Content-Type"] = ctype
    end

    resp, err = http_send(credentials, req, status)


    return resp, err
  end

  def self.http_send(credentials, req, status)
    err = credentials.authenticate(req)
    if err != nil
      return nil, err
    end

    req["User-Agent"] = API_CLIENT_IDENTIFIER
    uri = URI.parse(credentials.host)

    if credentials.debug
      puts "uri:"
      puts uri.inspect
    end

    http = Net::HTTP.new(uri.host, uri.port)

    if uri.is_a?(URI::HTTPS)
      http.use_ssl = true
      if credentials.skip_ssl_verification
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      else
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      end
    end

    if credentials.debug
      puts "method:"
      puts req.method
      puts "path:"
      puts req.path
      puts "body:"
      puts req.body.inspect
      puts "-------"
    end
    resp = http.request(req)

    err = handleResponseStatus(resp, status)

    return resp, err
  end

  def self.handleResponseStatus(resp, expectedStatus)
    case resp.code.to_i
      when expectedStatus
        return
      when 400
        return PhraseApp::RequestErrors::ErrorResponse.new(resp)
      when 404
        return raise("not found")
      when 422
        return PhraseApp::RequestErrors::ValidationErrorResponse.new(resp)
      when 429
        return PhraseApp::RequestErrors::RateLimitingError.new(resp)
      else
        return raise("unexpected status code (#{resp.code}) received; expected #{expectedStatus}")
    end
  end
end
