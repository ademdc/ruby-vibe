# frozen_string_literal: true

module RubyVibe
  ##
  # Shortcut to initialize Bot and send message.
  # @see https://developers.viber.com/docs/api/rest-bot-api/#send-message
  #
  # @note Configuration constants must be defined to use this class.
  #
  # @example Configure constants
  #   RubyVibe::TOKEN  = 'my_api_token'
  #   RubyVibe::NAME   = 'my_nickname'
  #   RubyVibe::AVATAR = 'https_avatar_url'
  #
  # @example Send text message
  #   msg = RubyVibe::SendMessage[message: 'text', sender_name: 'my_nickname']
  #   pp msg.error_message unless msg.success?
  #
  class SendMessage
    ##
    # Send message to user.
    #
    # @param  [Hash]   opts
    # @return [Data#response]
    # @see Bot#send_message
    #
    def self.[](opts = {})
      Bot.new.send_message(opts)
    end
  end

  ##
  # Shortcut to initialize Bot and broadcast message.
  # @see https://developers.viber.com/docs/api/rest-bot-api/#broadcast-message
  #
  # @note Configuration constants must be defined to use shortcut classes
  #
  # @example Configure constants
  #   RubyVibe::TOKEN  = 'my_api_token'
  #   RubyVibe::NAME   = 'my_nickname'
  #   RubyVibe::AVATAR = 'https_avatar_url'
  #
  class BroadcastMessage
    ##
    # @example Broadcast message to multiple users
    #   msg = RubyVibe::BroadcastMessage[message:   'text',
    #                                    receivers: %w[user_1 user_2]
    #                                    ]
    #   pp msg.error_message unless msg.success?
    #
    def self.[](opts = {})
      Bot.new.broadcast_message(opts)
    end
  end

  ##
  # @see https://developers.viber.com/docs/api/rest-bot-api/#set-webhook
  #
  class SetWebhook
    # @note Configuration constants must be defined to use shortcut classes
    def self.[](opts = {})
      Bot.new.set_webhook(opts)
    end
  end

  ##
  # @see https://developers.viber.com/docs/api/rest-bot-api/#get-account-info
  #
  class GetAccountInfo
    # @note Configuration constants must be defined to use shortcut classes
    def self.[]
      Bot.new.get_account_info
    end
  end

  ##
  # @see https://developers.viber.com/docs/api/rest-bot-api/#get-user-details
  #
  class GetUserDetails
    # @note Configuration constants must be defined to use shortcut classes
    def self.[](user_id)
      Bot.new.get_user_details(user_id)
    end
  end

  ##
  # @see https://developers.viber.com/docs/api/rest-bot-api/#get-online
  #
  class GetOnline
    # @note Configuration constants must be defined to use shortcut classes
    def self.[](*user_ids)
      Bot.new.get_online(*user_ids)
    end
  end
end
