class RubyVibe
  module Calls
    module Info

      def get_account_data
        client.action(RubyVibe::URLS::GET_ACCOUNT_INFO)
      end

      def set_webhook(url, events: [], send_name: true, send_photo: true)
        payload = {
          url: url,
          event_types: events,
          send_name: send_name,
          send_photo: send_photo
        }

        client.action(RubyVibe::URLS::SET_WEBHOOK, payload: payload)
      end
    end
  end
end
