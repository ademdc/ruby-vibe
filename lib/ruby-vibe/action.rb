require_relative 'client'

module ACTION

  class Send_Message
    def self.[]( opts = {} )
      Client.new.viberize(URL::SEND_MESSAGE, opts)
    end
  end


  class Broadcast_Message
    def self.[]( opts = {} )
      Client.new.viberize(URL::BROADCAST_MESSAGE, opts)
    end
  end


  class Get_Account_Data
    def self.[]( user_id )
      Client.new.viberize(URL::GET_ACCOUNT_INFO, info: true)
    end
  end


  class Get_User_Detils
    def self.[]( user_id )
      Client.new.viberize(URL::GET_USER_DETAILS, id: user_id, info: true)
    end
  end


  class Set_Webhook
    def self.[]( opts = {} )
      Client.new.viberize(URL::SET_WEBHOOK, opts)
    end
  end


  class Get_Online
    def self.[]( *user_ids )
      viberize(URL::GET_ONLINE, ids: Array(user_ids), info: true )
    end
  end

end
