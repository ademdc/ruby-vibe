# This is development branch

Please go to https://github.com/ademdc/ruby-vibe 
This branch is under active development, not ready to use!

# ruby-vibe
Ruby client for Viber REST API


## Installation
Add this line to your application's Gemfile:

```ruby
gem 'ruby-vibe', '1.0.1', require: 'ruby-vibe'
```

...followed with:
```bash
bundle install
```

Or install it with:
```bash
gem install ruby-vibe
```

## Usage
```ruby
viber = RubyVibe.new(auth_token: <YOUR_AUTH_TOKEN>)
```

Also, it is possible to add a `ruby-vibe.rb` file in in the initializers folder with the following content:

```ruby
RubyVibe.configure do |config|
  config.auth_token    = <YOUR_AUTH_TOKEN>
  config.sender_name   = 'RubyVibe'
  config.sender_avatar = 'http://avatar.example.com' 
end
```

In this case the client can be initialized without any params: `viber = RubyVibe.new`

### Get account data
```ruby
viber.get_account_data
```

### Response
The reponse of each method is a `Struct` with three keys: `success?`, `hash` and `error_message`. \

For a send message request the response could look like this: 

```ruby
#<struct :success?=true, hash={"status"=>0, "status_message"=>"ok", "message_token"=>5595771666503728439, "chat_hostname"=>"SN-CHAT-16_"}, error_message=nil> 
```

### Set a webhook
```ruby
viber.set_webhook('your_site/api/webhook', events: [])
```
See list of possible events on: `https://developers.viber.com/docs/api/rest-bot-api/#post-data`

### Send a message
```ruby
viber.send_message(receiver: '<RECEIVER_ID>', text: 'Hello from RubyVibe!', sender_name: 'Sender', sender_avatar: 'http://avatar.example.com', tracking_data: 'tracking data')
```

Add a `keyboard` parameter to the call to send predefined text keyboard to the user. More about it on `https://developers.viber.com/docs/tools/keyboards/`

### Broadcast a message
```ruby
viber.broadcast_message(broadcast_list:['<USER_ID>'], text: 'Hi from RubyVibe!', sender_name: 'RubyVibe', sender_avatar: 'http://avatar.example.com', type: 'text')
```

### Get user details
```ruby
viber.get_user_details('<USER_ID>')
```

### Get last online status
```ruby
viber.get_online( 'USER_ID', 'ANOTHER_USER_ID' )
# or
viber.get_online(['<USER_ID>', '<ANOTHER_USER_ID>'])
```

## Thank you for using RubyVibe!


