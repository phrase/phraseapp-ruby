module PhraseApp

  URL = "https://api.phraseapp.com"

  module Auth

    # See PhraseApp::Client for usage example
    class Credentials < OpenStruct
      def initialize(hash={})
        super(hash)
        @host ||= hash.fetch(:host, PhraseApp::URL)
      end

      def host
        @host
      end

      def validate!
        if self.username.to_s == "" && self.token.to_s == ""
          raise ValidationError.new("either username or token must be given")
        end
      end

      def authenticate(req)
        load_config
        validate!

        if self.token && self.token != ""
          req["Authorization"] = "token #{self.token}"
        elsif self.username && self.username != ""
          req.basic_auth(self.username, self.password)

          if self.tfa or self.tfa_token # TFA only required for username+password based login.
            raise "Multi-Factor Token required in config but not provided." unless self.tfa_token
            req["X-PhraseApp-OTP"] = auth.tfa_token
          end
        end

        return nil
      end

    private
      def load_config
        path = config
        configCredentials = Credentials.new
        if path && File.exists?(path)
          content = File.read(path)
          configCredentials = Credentials.new(JSON.load(content))
        end

        # Only set token if username not specified on commandline.
        if configCredentials.token && configCredentials.token != "" && self.token.nil? && self.username.nil?
          self.token = configCredentials.token
        elsif configCredentials.username && configCredentials.username != "" && self.username.nil?
          self.username = configCredentials.username
        elsif configCredentials.password && configCredentials.password != "" && self.password.nil?
          self.password = configCredentials.password
        end

        if configCredentials.tfa && self.tfa == ""
          self.tfa = configCredentials.tfa
        end

        if configCredentials.host
          self.host = configCredentials.host
        end

        if configCredentials.skip_ssl_verification
          self.skip_ssl_verification = configCredentials.skip_ssl_verification
        end

        if configCredentials.debug
          self.debug = configCredentials.debug
        end
      end
    end
  end
end

class ValidationError < StandardError
end
