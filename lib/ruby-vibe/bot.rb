require_relative 'client'

class RubyVibe::Bot < RubyVibe::Client

  TOKEN  = ''
  SENDER = ''
  AVATAR = ''

  def initialize( auth_token: nil, sender: nil, avatar: nil )

    auth_token ||= TOKEN
    sender     ||= SENDER
    avatar     ||= AVATAR

    super(auth_token: auth_token, sender: sender, avatar: avatar)
  end


  def send_message( opts = {} )
    viberize(URL::SEND_MESSAGE, opts)
  end


  def broadcast_message( opts = {} )
    viberize(URL::BROADCAST_MESSAGE, opts)
  end


  def get_account_data
    viberize(URL::GET_ACCOUNT_INFO, info: true)
  end


  def set_webhook( opts = {} )
    viberize(URL::SET_WEBHOOK, opts)
  end


  def get_user_details(user_id)
    viberize(URL::GET_USER_DETAILS, id: user_id, info: true)
  end


  def get_online(*user_ids)
    viberize(URL::GET_ONLINE, ids: Array(user_ids), info: true)
  end

end
