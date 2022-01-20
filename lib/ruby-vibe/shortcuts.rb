# frozen_string_literal: true

module RubyVibe
  ##
  # Shortcut to initialize Bot and send message.
  #
  # @note Configuration constants must be defined to use this class.
  #
  # @example Configure constants
  #   RubyVibe::TOKEN  = 'my_api_token'
  #   RubyVibe::NAME   = 'my_nickname'
  #   RubyVibe::AVATAR = 'https_avatar_url'
  #
  # @example Send text message
  #   msg = RubyVibe::Message[message: 'text', sender_name: 'my_nickname']
  #   pp msg.error_message unless msg.success?
  #
  class Message
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

  class GetAccountData
    def self.[](user_id)
      Bot.new.get_account_data(user_id)
    end
  end

  class GetUserDetails
    def self.[](user_id)
      Bot.new.get_user_details(user_id)
    end
  end

  class SetWebhook
    def self.[](opts = {})
      Bot.new.set_webhook(opts)
    end
  end

  class GetOnline
    def self.[](*user_ids)
      Bot.new.get_online(*user_ids)
    end
  end
end
