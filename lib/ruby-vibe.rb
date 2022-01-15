require_relative 'ruby-vibe/client'
require_relative 'ruby-vibe/url'
require_relative 'ruby-vibe/version'
require_relative 'ruby-vibe/action'

# NOT READY TO USE - COMMENTS ARE TO NOT FORGET WHAT I DID

# This is a class to be used by end user
# Prepare new connection, type-checks are defined in client.rb
# 'viberize' is also defined in client.rb, as private class

class RubyVibe

  include ACTION

  attr_reader :response

  def initialize( auth_token: nil, sender: nil, avatar: nil )
    @client = Client.new(auth_token: auth_token, sender: sender, avatar: avatar)
  end


  def send_message( opts = {} )
    @client.viberize(URL::SEND_MESSAGE, opts)
  end


  def broadcast_message( opts = {} )
    @client.viberize(URL::BROADCAST_MESSAGE, opts)
  end


  def get_account_data
    @client.viberize(URL::GET_ACCOUNT_INFO, info: true)
  end


  def set_webhook( opts = {} )
    @client.viberize(URL::SET_WEBHOOK, opts)
  end


  def get_user_details(user_id)
    @client.viberize(URL::GET_USER_DETAILS, id: user_id, info: true)
  end


  def get_online(*user_ids)
    @client.viberize(URL::GET_ONLINE, ids: Array(user_ids), info: true)
  end

end
