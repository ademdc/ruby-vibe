class RubyVibe
  class Response 
    
    attr_accessor :response

    def initialize(response)
      @response = response
    end

    class << self
      def parse(response)
        response = new(response)
        response.parse
      end
    end

    def parse
      success       = true
      error_message = nil
      hash          = JSON.parse(response.body)

      unless hash.dig('status').to_i == 0
        success = false 
        error_message =  hash.dig('status_message')
      end
     
      Struct.new(:success?, :se, :error_message).new(success, hash, error_message)
    end
  end
end