require 'grow_calls'
require 'rspec'
require 'rack/test'

Rspec.describe GrowCalls do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "says Grow Calls API" do
    get "/"
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Grow Calls API")
  end
end
