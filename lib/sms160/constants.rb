module Sms160
  BASE_URI = 'http://www.160.com.au/api/sms.asmx'.freeze
  BALANCE_ENDPOINT = "#{BASE_URI}/api/sms.asmx/GetCreditBalance".freeze
  SEND_MESSAGE_ENDPOINT = "#{BASE_URI}/api/sms.asmx/SendMessage".freeze
  MESSAGE_STATUS_ENDPOINT = "#{BASE_URI}/api/sms.asmx/GetMessageStatus".freeze

  API_ERROR = [
    'Error with message',
    'Error delivering message',
    'Routing error',
    'User cancelled message delivery'
  ].freeze

  API_PENDING = [
    'Awaiting Result',
    'Sending message..'
  ].freeze

  API_SUCCESS = [
    'Delivered to carrier',
    'Delivered to handset',
    'OK'
  ].freeze
end
