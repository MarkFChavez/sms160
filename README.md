# Sms160

This gem is a wrapper for the australian SMS provider 160.com.au

## Installation

Add this line to your application's Gemfile:

    gem 'sms160', '~> 1.0.0'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sms160

## Usage

First, you have to define the credentials for your sms160 account:

    Sms160.configure do |config|
      config.username = "your sms160 username"
      config.password = "your sms160 password"
    end

### Getting credit balance

    Sms160::Message.new.credit_balance # => "3000.00"

### Sending SMS

    sms = Sms160::Message.new(to: "recipient", body: "message", reply_to: "some email")
    sms.send_message # => true if sent, false otherwise

## Contributing

1. Fork it ( http://github.com/mrkjlchvz/sms160/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

