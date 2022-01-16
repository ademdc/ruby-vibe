require_relative 'client'

# Set of predefined viber api requests. This class is used directly by user.
#
# @example
#
#  @bot = RubyVibe::Bot.new(  token: 'my_viber_api_token',
#                              name: 'sender_name',
#                            avatar: 'avatar_url'
#                          )
#
class RubyVibe::Bot < RubyVibe::Client


  def initialize( token: nil, name: nil, avatar: nil )

    token  ||= RubyVibe::TOKEN
    name   ||= RubyVibe::NAME
    avatar ||= RubyVibe::AVATAR

    super(token: token, name: name, avatar: avatar)
  end

  ##
  # Send message to user.
  #
  #  @param [Hash] opts
  #
  #  @option opts [String] message     **Required**. Message text
  #  @option opts [String] to          **Required**. Message receiver
  #  @option opts [String] sender_name **Optional**. Sender name || RubyVibe::NAME
  #  @option opts [String] avatar      **Optional**. Avatar url  || RubyVibe::AVATAR
  #  @option opts [String] keyboard    **Optional**. Add keyboard to message
  #  @option opts [String] rich_media  **Optional**. Send rich_media message
  #
  #  @return [Hash] response Response hash defined in RubyVibe::Client
  #
  def send_message( opts = {} )
    viberize(URL::MESSAGE, opts)
  end

  ##
  # Broadcast message to multiple users.
  #
  #  @param [Hash] opts
  #
  #  @option opts [String] message     **Required**. Message text
  #  @option opts [Array]  to          **Required**. Message receiver
  #  @option opts [String] sender_name **Optional**. Sender name || RubyVibe::NAME
  #  @option opts [String] avatar      **Optional**. Avatar url  || RubyVibe::AVATAR
  #  @option opts [String] keyboard    **Optional**. Add keyboard to message
  #  @option opts [String] rich_media  **Optional**. Send rich_media message
  #
  #  @return [Hash] response Response hash defined in RubyVibe::Client
  #
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
