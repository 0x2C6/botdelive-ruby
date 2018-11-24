# BotDelive

**BotDelive** is a Push Notification and 2-factor authentication API service that works over the chat bots (Telegram and Messenger).

-------------

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bot_delive'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bot_delive

## Usage
Let's require the gem first. Don't forget to define "app_id" and "secret_key"

```ruby
require 'bot_delive'

BotDelive.configure do |config|
  config.app_id = 'test_id'
  config.secret_key = 'test_secret'
end
```
**Verify the "Access Code":**

```ruby
@response = BotDelive.verify(access_code: 'ByffboUAX')
if @response.success?
    @response.payload.user_id
end
```

**Send 2-factor authentication request (long polling):**

```ruby
@response = BotDelive.auth(user_id: 'user-id')
if @response.success?
    @response.payload.respond
end
```

**Send Push Notification request:**

```ruby
@response = BotDelive.push(
    user_id: 'user-id',
    message: 'test message from ruby test'
)

if @response.success?
    puts "push notification sent successfully"
end
```

Documentation
-------------

Complete documentation available at: [https://botdelive.com/docs](https://botdelive.com/docs)


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
