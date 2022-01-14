require 'rest-client'
require 'json'


# This is main client, that you'll probably never use directly.
# Saves token, name, avatar and response as Instance Variables.
# Check that token and sender are strings
# Check if avatar use SSL connection

class Client

  attr_accessor :token, :name, :avatar, :response

  TOKEN  = ''
  SENDER = ''
  AVATAR = ''
  
  def initialize( auth_token = TOKEN, sender = SENDER, avatar = AVATAR )

    raise 'Token must be string!' unless auth_token.is_a? String
    raise 'Sender name must be string' unless sender.is_a? String

    unless avatar.empty?
      raise 'Avatar URL must use SSL' unless avatar.start_with? 'https://'
    end

    @token, @sender, @avatar = auth_token, sender, avatar
  end


  private


  def action(url, payload: {}, http_method: :post)

    headers = {
      'User-Agent': "RubyVibe client v#{RubyVibe::VERSION})",
      'X-Viber-Auth-Token': @token
    }

    response = ::RestClient::Request.execute(
      method:     http_method, 
      url:        url,
      payload:    payload.to_json, 
      headers:    headers,
      timeout:    5, 
      verify_ssl: ::OpenSSL::SSL::VERIFY_NONE
      )

    @response = parse(response)
  end


  def viberize( call_action, opts = {} )
    payload = load_payload(opts)
    action(call_action, payload: payload)
  end


  def load_payload( opts = {} )

    @payload_defaults = {}

    @payload_defaults[:sender] = {
      name: opts[:sender_name] || @sender,
      avatar: opts[:sender_avatar] || @avatar
    } if opts[:info].nil?

    opts.map do |key, value|
      next if key == :keyboard and value.nil?
      next if key == :rich_media and value.nil?
      @payload_defaults.merge!(key: value)
    end

    return @payload_defaults
  end


  def parse( response )
    success, error_message = true, nil
    hash = JSON.parse(response.body)

    unless hash.dig('status').to_i == 0
      success = false 
      error_message = hash.dig('status_message')
    end
     
    Struct.new(:success?, :hash, :error_message).new(success, hash, error_message)
  end
end
