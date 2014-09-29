require "spec_helper"

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

    it "can set the username and password" do
      sms = Sms160::Message.new(username: "mark", password: "12345")
      expect(sms.username).to eq "mark"
      expect(sms.password).to eq "12345"
    end
  end
end
