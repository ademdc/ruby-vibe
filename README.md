# ruby-vibe
Ruby client for Viber REST API

## Installation
Install from source:

```bash
git clone https://www.github.com/ademdc/ruby-vibe.git \
&& cd ruby-vibe \
&& bundle install
```

To build gem and install it locally:

```bash
# clone repo from previous step
rake build
gem install pkg/ruby-vibe-2.0.3.gem
```

From Gemfile:

```ruby
gem 'ruby-vibe', '2.0.3'
```

...followed with:
```bash
bundle install
```


## Usage
 >Run `yard` to generate documentation.  

To initialize new bot, call Bot with viber authentication token:

```ruby
bot = RubyVibe::Bot.new(token: <YOUR_AUTH_TOKEN>)
```

Also, it is possible to add a `ruby-vibe.rb` file in in the initializers folder with the following content:

```ruby
RubyVibe::TOKEN = <YOUR_AUTH_TOKEN>
RubyVibe::NAME = <YOUR_SENDER_NAME>
RubyVibe::AVATAR = <AVATAR_HTTPS_URL>
```

In this case the bot can be initialized without any params: `bot = RubyVibe::Bot.new`

### Send message
```ruby
bot.send_message(text: 'hello viber from ruby!', receiver: 'someone')
```
If you configure token as constant `RubyVibe::TOKEN`, you can use class (shortcut) methods:

```ruby
RubyVibe::Message[text: 'my message', receiver: 'user_id']

RubyVibe::GetOnline[user_id]
```

### Get account info
```ruby
bot.get_account_info
```

### Response
 >_:hash changed to :data to make rubocop happy_  

The reponse of each method is a `Struct` with three keys: `success?`, `data` and `error_message`. \

For a send message request the response could look like this:  

```ruby
#<struct :success?=true, data={"status"=>0, "status_message"=>"ok", "message_token"=>5595771666503728439, "chat_hostname"=>"SN-CHAT-16_"}, error_message=nil> 
```

### Tests
 - Run `rspec` to execute all tests. Feel free to write new ones!
 - Run `rubocop` to inspect code quality. `.rubocop_todo.yml` contain current issues that need to be solved in future.

## Thank you for using RubyVibe!


