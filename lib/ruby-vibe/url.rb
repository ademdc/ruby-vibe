# frozen_string_literal: true

module URL
  API               = 'https://chatapi.viber.com/pa'
  SET_WEBHOOK       = "#{API}/set_webhook".freeze
  MESSAGE           = "#{API}/send_message".freeze
  GET_ACCOUNT_INFO  = "#{API}/get_account_info".freeze
  GET_USER_DETAILS  = "#{API}/get_user_details".freeze
  BROADCAST_MESSAGE = "#{API}/broadcast_message".freeze
  GET_ONLINE        = "#{API}/get_online".freeze
end
