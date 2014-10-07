require "spec_helper"
require "net/http"

describe Sms160 do
  describe "accessors" do
    it "can set the recipient of the message" do
      sms = Sms160::Message.new(to: "+639182390239")
      expect(sms.to).to eq "+639182390239"
    end

    it "can set the body of the message" do
      sms = Sms160::Message.new(body: "hello world!")
      expect(sms.body).to eq "hello world!"
    end

    it "can set the reply to of the message" do
      sms = Sms160::Message.new(reply_to: "+639182390239")
      expect(sms.reply_to).to eq "+639182390239"
    end
  end

  describe "configuration block" do
    before(:each) do
      Sms160.configure do |config|
        config.username = "username"
        config.password = "password"
      end
    end

    it "gets the credit balance" do
      stub_request(:get, "#{Sms160::BALANCE_ENDPOINT}?username=username&password=password").
      to_return(:status => 200, :body => "<?xml version='1.0' encoding='utf-8'?><string xmlns='www.160.com.au/api'>4621.00</string>", :headers => {})
      
      sms = Sms160::Message.new
      expect(sms.credit_balance).to eq "4621.00"
    end
  end
end
