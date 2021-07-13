require 'rest-client'
require 'json'

class RubyVibe
  class Client
    
    attr_accessor :token

    def initialize(auth_token:) 
      RubyVibe.configure

      @token = auth_token || RubyVibe.config.auth_token
    end

    def action(url, payload: {}, http_method: :post)
      headers = {
        'User-Agent': "RubyVibe client v#{RubyVibe::VERSION})",
        'X-Viber-Auth-Token': token 
      }

      response = ::RestClient::Request.execute(
        method:     http_method, 
        url:        url,
        payload:    payload.to_json, 
        headers:    headers,
        timeout:    5, 
        verify_ssl: ::OpenSSL::SSL::VERIFY_NONE
      )
      
      RubyVibe::Response.parse(response)
    end
  end
end