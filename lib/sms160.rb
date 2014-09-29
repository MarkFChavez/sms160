require "sms160/version"
require "sms160/constants"
require "open-uri"
require "rest_client"

module Sms160
  class Message
    attr_accessor :to, :body, :reply_to
    attr_accessor :username, :password

    def initialize(attr = {})
      @to = attr[:to]
      @body = attr[:body]
      @reply_to = attr[:reply_to]

      @options = fetch_sms_credentials
    end

    def credit_balance
      response = RestClient.get BALANCE_ENDPOINT, params: @options
      # Hash.from_xml(response)["string"]
      response.body
    end

    private

    def fetch_sms_credentials
      {
        username: username,
        password: password
      }
    end
  end
end
