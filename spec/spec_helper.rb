require "bundler/setup"
require "webmock/rspec"

Bundler.setup
WebMock.disable_net_connect!(allow_localhost: true)

require "sms160"

RSpec.configure do |config|

end
