# ruby-vibe
Ruby client for Viber REST API


## Installation
Add this line to your application's Gemfile:

```ruby
gem 'ruby-vibe', '2.0.0', require: 'ruby-vibe'
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
viber = RubyVibe::Bot.new(token: <YOUR_AUTH_TOKEN>)
```

Also, it is possible to add a `ruby-vibe.rb` file in in the initializers folder with the following content:

```ruby
RubyVibe::TOKEN = <YOUR_AUTH_TOKEN>
RubyVibe::NAME = <YOUR_SENDER_NAME>
RubyVibe::AVATAR = <AVATAR_HTTPS_URL>
```

In this case the client can be initialized without any params: `viber = RubyVibe.new`

### Get account data
```ruby
viber.send_message(message: 'hello viber from ruby!', receiver: 'someone')
```

### Response
_:hash changed to :data to make rubocop happy_  

The reponse of each method is a `Struct` with three keys: `success?`, `data` and `error_message`. \

For a send message request the response could look like this:  

```ruby
#<struct :success?=true, data={"status"=>0, "status_message"=>"ok", "message_token"=>5595771666503728439, "chat_hostname"=>"SN-CHAT-16_"}, error_message=nil> 
```

## Thank you for using RubyVibe!


