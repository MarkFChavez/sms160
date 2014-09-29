require "sms160/version"
require "sms160/constants"
require "active_support/core_ext"
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

    def credit_balance
      response = RestClient.get(BALANCE_ENDPOINT, params: fetch_credentials)
      Hash.from_xml(response)["string"]
    end

    def send                                                                               
      raise "Incomplete Parameters ERROR" unless to and body and reply_to                  
      
      options = fetch_credentials.merge!(mobileNumber: to, messageText: body.to_str, sms2way: reply_to)
      response = RestClient.post(SEND_MESSAGE_ENDPOINT, options)
                       
      if response.code.to_i == 200                                                         
        response = Hash.from_xml(response)["string"]                                       
          
        if response.include?("ERR") or API_ERROR.include?(response)                        
          false
        else
          response
        end
      else
        false
      end
    end

    private

    def fetch_credentials
      { username: username, password: password }
    end
  end
end
