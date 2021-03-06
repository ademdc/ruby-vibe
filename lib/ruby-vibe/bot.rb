# frozen_string_literal: true

require_relative 'client'

module RubyVibe
  ##
  # Set of predefined viber api requests. This class is used directly by user.
  # Define constants for configuration settings, or add them on initialization.
  #
  # @example Set default configuration
  #   RubyVibe::TOKEN  = 'my_viber_auth_token'
  #   RubyVibe::NAME   = 'my_viber_nickname'
  #   RubyVibe::AVATAR = 'avatar_url'
  #
  class Bot < RubyVibe::Client
    ##
    # @example Initialize new bot with user-defined configuration
    #  @bot = RubyVibe::Bot.new(token:  'auth_token',
    #                           name:   'sender_name',
    #                           avatar: 'https_avatar_url' )
    #
    # @param [String] token   **Optional**.  Auth token provided by Viber.
    # @param [String] name    **Optional**.  Sender name provided by user.
    # @param [String] avatar  **Optional**.  SSL link to user photo.
    #
    # @return [Bot] Bot object to work with.
    #
    def initialize(token: nil, name: nil, avatar: nil)
      token  ||= RubyVibe::TOKEN
      name   ||= RubyVibe::NAME
      avatar ||= RubyVibe::AVATAR

      super(token: token, name: name, avatar: avatar)
    end

    ##
    # Send message to user.
    # @see https://developers.viber.com/docs/api/rest-bot-api/#send-message
    #
    # @param [Hash] opts
    #
    # @option opts [String] message     **Required**. Message text
    # @option opts [String] receiver    **Required**. Message receiver
    # @option opts [String] sender_name **Optional**. Sender name || RubyVibe::NAME
    # @option opts [String] avatar      **Optional**. Avatar url  || RubyVibe::AVATAR
    # @option opts [String] keyboard    **Optional**. Add keyboard to message
    # @option opts [String] rich_media  **Optional**. Send rich_media message
    #
    # @return [Hash] Response hash defined in RubyVibe::Client
    #
    def send_message(opts = {})
      opts.merge!(type: 'text') unless opts[:type]

      viberize(URL::SEND_MESSAGE, opts)
    end

    ##
    # Broadcast message to multiple users.
    # @see https://developers.viber.com/docs/api/rest-bot-api/#broadcast-message
    #
    # @param [Hash] opts Viber API options for broadcast_message request
    #
    # @option opts [String] message     **Required**. Message text
    # @option opts [Array]  receivers   **Required**. Message receivers
    # @option opts [String] sender_name **Optional**. Sender name || RubyVibe::NAME
    # @option opts [String] avatar      **Optional**. Avatar url  || RubyVibe::AVATAR
    # @option opts [String] keyboard    **Optional**. Add keyboard to message
    # @option opts [String] rich_media  **Optional**. Send rich_media message
    #
    # @return [Hash] Response hash defined in RubyVibe::Client
    #
    def broadcast_message(opts = {})
      opts.merge!(type: 'text') unless opts[:type]
      
      viberize(URL::BROADCAST_MESSAGE, opts)
    end

    ##
    # @see https://developers.viber.com/docs/api/rest-bot-api/#set-webhook
    #
    def set_webhook(opts = {})
      viberize(URL::SET_WEBHOOK, opts)
    end

    ##
    # @see https://developers.viber.com/docs/api/rest-bot-api/#get-account-info
    #
    def get_account_info
      viberize(URL::GET_ACCOUNT_INFO, info: true)
    end

    ##
    # @see https://developers.viber.com/docs/api/rest-bot-api/#get-user-details
    #
    def get_user_details(user_id)
      viberize(URL::GET_USER_DETAILS, id: user_id, info: true)
    end

    ##
    # @see https://developers.viber.com/docs/api/rest-bot-api/#get-online
    #
    def get_online(*user_ids)
      viberize(URL::GET_ONLINE, ids: Array(user_ids), info: true)
    end
  end
end
