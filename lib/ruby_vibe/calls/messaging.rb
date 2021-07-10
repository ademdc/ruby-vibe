class RubyVibe
  module Calls
    module Messaging

      def send_message(receiver:, text:, sender_name: nil, sender_avatar: nil, tracking_data: nil, type: 'text', keyboard: nil)
        payload = {
          receiver:receiver,
          sender:{
             name:sender_name || RubyVibe.config.sender_name,
             avatar:sender_avatar || RubyVibe.config.sender_avatar
          },
          tracking_data:tracking_data,
          type:type,
          text:text
        }.compact

        payload.merge!({ keyboard: keyboard }) unless keyboard.nil?

        client.action(RubyVibe::URLS::MESSAGE, payload: payload)
      end

      def broadcast_message(broadcast_list:[], text:, sender_name: nil, sender_avatar: nil, type: 'text', rich_media: nil, keyboard: nil)
        payload = {
          sender:{
             name: sender_name || RubyVibe.config.sender_name,
             avatar: sender_avatar || RubyVibe.config.sender_avatar
          },
         type: type,
          text: text,
          broadcast_list: broadcast_list,
        }

        payload.merge!({ rich_media: rich_media }) unless rich_media.nil?
        payload.merge!({ keyboard: keyboard }) unless keyboard.nil?

        client.action(RubyVibe::URLS::BROADCAST_MESSAGE, payload: payload)
      end
    end
  end
end
