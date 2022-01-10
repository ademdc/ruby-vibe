class RubyVibe
  class Response 
    
    attr_accessor :response

    def initialize(response)
      @response = response
    end

    def parse
      success, error_message = true, nil
      hash = JSON.parse(@response.body)

      unless hash.dig('status').to_i == 0
        success = false 
        error_message = hash.dig('status_message')
      end
     
      Struct.new(:success?, :hash, :error_message).new(success, hash, error_message)
    end

    def self.parse(response)
      new(response).parse
    end

  end
end
