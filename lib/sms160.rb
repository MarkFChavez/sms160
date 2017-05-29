require 'sms160/version'
require 'sms160/constants'
require 'sms160/configuration'
require 'sms160/message'

module Sms160
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end
