module RubyVibe

  ##
  # Shortcut to initialize Bot and send message.
  #
  # @required RubyVibe::TOKEN to be defined
  #
  # @example
  #
  #  RubyVibe::TOKEN = 'viber_api_auth_token'
  #
  #  msg = RubyVibe::Message[message: 'text', sender_name: 'my_nickname']
  #  pp msg.error_message unless msg.success?
  #
  class Message 

    ##
    # Send message with default configuration
    # Accept options hash and return response object
    # 
    # @param  [Hash]   options
    # @return [Object] response  Return response from client
    # @see RubyVibe::Bot#send_message
    #
    def self.[]( opts = {} )
      Bot.new.send_message(opts)
    end
  end


  class BroadcastMessage 
    def self.[]( opts = {} )
      Bot.new.broadcast_message(opts)
    end
  end


  class GetAccountData 
    def self.[]( user_id )
      Bot.new.get_account_data(user_id)
    end
  end


  class GetUserDetails 
    def self.[]( user_id )
      Bot.new.get_user_details(user_id)
    end
  end


  class SetWebhook 
    def self.[]( opts = {} )
      Bot.new.set_webhook(opts)
    end
  end


  class GetOnline 
    def self.[]( *user_ids )
      Bot.new.get_online( *user_ids )
    end
  end

end
