# frozen_string_literal: true

##
# Viber API urls as constant for corresponding method.
#
# @see https://developers.viber.com/docs/api/rest-bot-api
#
module URL
  # viber api url
  API = 'https://chatapi.viber.com/pa'

  # api url to set webhook
  SET_WEBHOOK = "#{API}/set_webhook".freeze

  # api url to send message to user
  SEND_MESSAGE = "#{API}/send_message".freeze

  # api url to get info about your account
  GET_ACCOUNT_INFO = "#{API}/get_account_info".freeze

  # api url to get info about user (twice per 12h for each ID)
  GET_USER_DETAILS = "#{API}/get_user_details".freeze

  # api url to broadcast message to multiple users (must be subscribed to bot)
  BROADCAST_MESSAGE = "#{API}/broadcast_message".freeze

  # api url to check if user(s) is online
  GET_ONLINE = "#{API}/get_online".freeze
end
