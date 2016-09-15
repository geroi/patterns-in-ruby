class User
  def initialize name, type, options
    @name = name
    @type = type
    @options = options
    @strategy = case @type
              when :password
                Auth::Password.new self
              when :public_key
                Auth::Public_key.new self
              when :oauth
                Auth::OAuth.new self
              end
  end

  def login
    @strategy.authenticate! options
    @strategy.authenticated?
  end
end

module Auth
  class Password
    def initialize user
      @authenticated = false
    end

    def authenticate! options={}
    end
  end
  class OAuth
    def initialize user
      @authenticated = false
    end

    def token_approved?
    end

    def authenticate! options={}
    end
  end
  class Public_key
    def initialize user
      @authenticated = false
    end

    def public_key_matches?
    end

    def authenticate! options={}
      public_key_matches?
    end
  end
end