module PhraseApp
  module Auth

    class AuthHandler < OpenStruct
      def validate
        if self.username == "" && self.token == ""
          return raise("either username or token must be given")
        else
          return nil
        end
      end

      def load_config
        path = self.config
        tmpA = AuthHandler.new

        puts path
        if path && File.exists?(path)
          content = File.read(path)
          tmpA = AuthHandler.new(JSON.load(content))
        end

        # Only set token if username not specified on commandline.
        if tmpA.token && tmpA.token != "" && self.token.nil? && self.username.nil?
          self.token = tmpA.token
        elsif tmpA.username && tmpA.username != "" && self.username.nil?
          self.username = tmpA.username
        elsif tmpA.password && tmpA.password != "" && self.password.nil?
          self.password = tmpA.password
        end

        if tmpA.tfa && self.tfa == ""
          self.tfa = tmpA.tfa
        end

        return nil
      end
    end

    def self.authH
      defined?(@@authH) && @@authH
    end

    def self.register_auth_handler(a)
      @@authH = a
    end
    
    def self.authenticate(req)
      if authH == nil
        raise("no auth handler registered")
      end

      if err = authH.load_config
        return err
      end

      if err = authH.validate
        return err
      end

      if authH.token && authH.token != ""
        req["Authorization"] = "token #{authH.token}"
      elsif authH.username && authH.username != ""
        req.basic_auth(authH.username, authH.password)

        if authH.tfa or authH.tfa_token # TFA only required for username+password based login.
          raise "Multi-Factor Token required in config but not provided." unless authH.tfa_token
          req["X-PhraseApp-OTP"] = auth.tfa_token
        end
      else
        raise "No authentication present"
      end

      return nil

    end
  end
end
