require_relative 'ruby-vibe/url'
require_relative 'ruby-vibe/bot'
require_relative 'ruby-vibe/version'

module RubyVibe

  class Send_Message < Bot
    def self.[]( opts = {} )
      new.send_message(opts)
    end
  end


  class Broadcast_Message < Bot
    def self.[]( opts = {} )
      new.broadcast_message(opts)
    end
  end


  class Get_Account_Data < Bot
    def self.[]( user_id )
      new.get_account_data(user_id)
    end
  end


  class Get_User_Detils < Bot
    def self.[]( user_id )
      new.get_user_details(user_id)
    end
  end


  class Set_Webhook < Bot
    def self.[]( opts = {} )
      new.set_webhook(opts)
    end
  end


  class Get_Online < Bot
    def self.[]( *user_ids )
      new.get_online(user_ids)
    end
  end

end

