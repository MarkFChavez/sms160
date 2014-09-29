module Sms160
  BASE_URI = "http://www.160.com.au/api/sms.asmx"
  BALANCE_ENDPOINT = "#{BASE_URI}/api/sms.asmx/GetCreditBalance"

  API_ERROR = [
    "Error with message",
    "Error delivering message",
    "Routing error",
    "User cancelled message delivery"
  ]

  API_PENDING = [
    "Awaiting Result",
    "Sending message.."
  ]

  API_SUCCESS = [
    "Delivered to carrier",
    "Delivered to handset",
    "OK"
  ]
end
