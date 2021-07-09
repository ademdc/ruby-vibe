class RubyVibe
  module Calls
    module Messaging

      def send_message(receiver:, text:, sender_name: nil, sender_avatar: nil, tracking_data: nil, type: 'text')
        payload = {
          receiver:receiver,
          min_api_version:1,
          sender:{
             name:sender_name || RubyVibe.config.sender_name,
             avatar:sender_avatar || RubyVibe.config.sender_avatar
          },
          tracking_data:tracking_data,
          type:type,
          text:text
        }.compact

        puts payload

        client.action(RubyVibe::URLS::MESSAGE, payload: payload)
      end
    end
  end
end
