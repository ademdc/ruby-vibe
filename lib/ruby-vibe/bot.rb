# frozen_string_literal: true

require_relative 'client'

##
# Set of predefined viber api requests. This class is used directly by user.
# Define constants for configuration settings, or add them on initialization.
#
# @example Set default configuration
#   RubyVibe::TOKEN  = 'my_viber_auth_token'
#   RubyVibe::NAME   = 'my_viber_nickname'
#   RubyVibe::AVATAR = 'avatar_url'
#
module RubyVibe
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
      viberize(URL::MESSAGE, opts)
    end

    ##
    # Broadcast message to multiple users.
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
    # @see Client#response
    #
    def broadcast_message(opts = {})
      viberize(URL::BROADCAST_MESSAGE, opts)
    end

    def get_account_data
      viberize(URL::GET_ACCOUNT_INFO, info: true)
    end

    def set_webhook(opts = {})
      viberize(URL::SET_WEBHOOK, opts)
    end

    def get_user_details(user_id)
      viberize(URL::GET_USER_DETAILS, id: user_id, info: true)
    end

    def get_online(*user_ids)
      viberize(URL::GET_ONLINE, ids: Array(user_ids), info: true)
    end
  end
end
