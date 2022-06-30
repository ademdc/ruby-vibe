# frozen_string_literal: true

require 'rest-client'
require 'json'

module RubyVibe
  ##
  # This class is almost never used directly by user.
  # Send actual request to viber api and perform type validation
  # for token, name and avatar (must be strings).
  #
  class Client
    attr_accessor :token, :name, :avatar

    attr_reader :response, :payload_hash

    alias sender name

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
    # @return [Object]
    #
    def initialize(token: nil, name: nil, avatar: nil)
      raise 'Token must be string!' unless token.is_a? String
      raise 'Sender name must be string' unless name.is_a? String

      raise 'Avatar URL must use SSL' if !avatar.empty? && !(avatar.start_with? 'https://')

      @token = token
      @name = name
      @avatar = avatar
    end

    private

    ##
    # Send payload to Viber API.
    #
    # @param [String] url **Required**. API url to send payload.
    # @param [Hash] payload **Optional**. Payload to send with request.
    # @return [Hash] Bot#response hash with all data.
    #
    def action(url, payload: {})
      headers = {
        'User-Agent': "RubyVibe client v#{RubyVibe::VERSION})",
        'X-Viber-Auth-Token': @token
      }

      response = ::RestClient::Request.execute(
        method: :post,
        url: url,
        payload: payload.to_json,
        headers: headers,
        timeout: 5,
        verify_ssl: ::OpenSSL::SSL::VERIFY_NONE
      )

      @response = parse(response)
    end

    ##
    # Method used by bot to construct viber api request.
    # Prepare payload and send it to api url.
    #
    # @param [String] api_url **Required**. URL corresponding to method name.
    # @param [Hash] opts **Optional**. Payload corresponding to method options.
    #
    def viberize(api_url, opts = {})
      payload = load_payload(opts)
      action(api_url, payload: payload)
    end

    ##
    # Construct payload to send with request.
    # If payload contain `info: true`, do not add sender name and avatar url.
    # Otherwise, add them together with _options hash_ to payload.
    # Nil values are not imported.
    #
    # @param [Hash] opts **Optional**. Data to create payload.
    # @return [Hash] Client#payload_hash to send with request.
    #
    def load_payload(opts = {})
      @payload_hash = {}

      if opts[:info].nil?
        @payload_hash[:sender] = {
          name: opts[:sender_name] || @name,
          avatar: opts[:sender_avatar] || @avatar
        }
      end

      opts.map do |key, value|
        next if value.nil?
        next if key == :info

        @payload_hash[key] = value
      end
      @payload_hash
    end

    ##
    # Construct response hash. Parse viber response and check status code.
    # If code is not zero (**0**), add `error_message` to response.
    #
    def parse(response)
      success = true
      error_message = nil
      hash = JSON.parse(response.body)

      unless hash['status'].to_i.zero?
        success = false
        error_message = hash['status_message']
      end

      Struct.new(:success?, :data, :error_message).new(success, hash, error_message)
    end
  end
end
