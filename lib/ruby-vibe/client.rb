require 'rest-client'
require 'json'

##
# This class is almost never used directly by user.  
# Send actual request to viber api and perform type validation
# for token, name and avatar (must be strings).
#
class RubyVibe::Client

  # save viber-api configuration data
  attr_accessor :token, :name, :avatar

  # save response hash, and payload for debugging
  attr_reader :response, :payload_options

  # will be removed
  alias :sender :name

  ##
  # @example Initialize new client
  #
  #   @client = Client.new(token: 'token', name: 'name', avatar: 'https_url')
  #
  # @param [String] token  **Required**. Viber auth token.
  # @param [String] name   **Required**. Sender name.
  # @param [String] avatar **Optional**. Avatar url.
  #
  # @raise [Token must be string] Token must be string.
  # @raise [Name must be string] Name must be string.
  # @raise [Avatar must use SSL] If defined, avatar must use https connection.
  #
  def initialize( token: nil, name: nil, avatar: nil )

    raise 'Token must be string!' unless token.is_a? String
    raise 'Sender name must be string' unless name.is_a? String

    unless avatar.empty?
      raise 'Avatar URL must use SSL' unless avatar.start_with? 'https://'
    end

    @token, @name, @avatar = token, name, avatar
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

    @payload_options = {}

    @payload_options[:sender] = {
      sender_name: opts[:sender_name] || @name,
      avatar: opts[:sender_avatar] || @avatar
    } if opts[:info].nil?

    opts.map do |key, value|
      next if value.nil?
      next if key == :info
      @payload_options[key] = value
    end
    return @payload_options
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
