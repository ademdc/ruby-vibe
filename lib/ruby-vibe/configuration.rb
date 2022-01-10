class RubyVibe

  class << self

    # Accessor for global configuration.
    attr_accessor :config

    def configure
      self.config ||= Configuration.new
      yield(config) if block_given?
    end
  end

  class Configuration
    attr_accessor :auth_token, :sender_name, :sender_avatar

    def initialize
      @auth_token    = nil
      @sender_name   = nil
      @sender_avatar = 'http://avatar.example.com'
    end
  end
end
