require 'simplecov'
SimpleCov.start
require 'dotenv'
Dotenv.load
require 'rack/test'
require 'rspec'
require 'webmock/rspec'
# require './serializers/ticketmaster_serializer'
# require './services/ticketmaster_service'
# require './services/zomato_service'
WebMock.disable_net_connect!(allow_localhost: true)
require './grow_calls'

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods
  def app() GrowCalls end
end

RSpec.configure { |c| c.include RSpecMixin }
