# ENV['APP_ENV'] = 'test'
#
# require './grow_calls'  # <-- your sinatra app
# require 'rspec'
# require 'rack/test'
#
# RSpec.describe 'The Grow Calls App' do
#   include Rack::Test::Methods
#
#   def app
#     Sinatra::Application
#   end
#
#   it "shows ph when sending zip" do
#     get '/ph?zip=80001'
#
#     expect(last_response).to be_ok
#     # expect(last_response.body).to eq('Hello World')
#   end
# end

require_relative 'spec_helper'

RSpec.describe 'root page page' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'can load the root path' do
    get '/'

    expect(last_response.body).to include('Grow Calls API')
  end
end
