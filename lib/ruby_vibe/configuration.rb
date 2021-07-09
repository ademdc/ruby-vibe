class RubyVibe
  class << self
    # Accessor for global configuration.
    attr_accessor :config
  end

  def self.configure
    self.config ||= Configuration.new
    yield(config) if block_given?
  end

  class Configuration
    attr_accessor :auth_token

    def initialize
      @auth_token = nil
    end
  end
end
