require_relative 'ruby-vibe/client'
require_relative 'ruby-vibe/url'
require_relative 'ruby-vibe/version'

# NOT READY TO USE - COMMENTS ARE TO NOT FORGET WHAT I DID

# This is a class to be used by end user
# Prepare new connection, type-checks are defined in client.rb
# 'viberize' is also defined in client.rb, as private class

class RubyVibe < Client

  TOKEN, NAME, AVATAR = '', '', '' 

  def initialize( auth_token = TOKEN, name = NAME, avatar = AVATAR )
    super(auth_token, name, avatar)
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
    viberize(URL::GET_USER_DETAILS, user_id)
  end


  def get_online(*user_ids)
    viberize(URL::GET_ONLINE, ids: Array(user_ids))
  end

end
