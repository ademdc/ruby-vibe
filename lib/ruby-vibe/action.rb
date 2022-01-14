require_relative 'client'

module ACTION

  class Send_Message
    def self.[]( opts = {} )
      call.viberize(URL::SEND_MESSAGE, opts)
    end
  end


  class Broadcast_Message
    def self.[]( opts = {} )
      call.viberize(URL::BROADCAST_MESSAGE, opts)
    end
  end


  class Get_Account_Data
    def self.[]( user_id )
      call.viberize(URL::GET_ACCOUNT_INFO, info: true)
    end
  end


  class Get_User_Detils
    def self.[]( user_id )
      call.viberize(URL::GET_USER_DETAILS, id: user_id, info: true)
    end
  end


  class Set_Webhook
    def self.[]( opts = {} )
      call.viberize(URL::SET_WEBHOOK, opts)
    end
  end


  class Get_Online
    def self.[]( *user_ids )
      call.viberize(URL::GET_ONLINE, ids: Array(user_ids), info: true )
    end
  end


  private


  def self.call
    Client.new
  end

end
