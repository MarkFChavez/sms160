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
    end

    def credit_balance(&block)
      raise "No block given" unless block.given?

      response = RestClient.get(BALANCE_ENDPOINT, params: fetch_credentials)
      block.call(response)
    end

    private

    def fetch_credentials
      { username: username, password: password }
    end
  end
end
