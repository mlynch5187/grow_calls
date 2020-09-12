require 'sinatra'
require 'pry'
require 'faraday'
require './opendata_service.rb'

class GrowCalls < Sinatra::Base
  get '/' do
    'Grow Calls API'
  end

  get '/ph' do
    content_type :json
    coordinates_conn = Faraday.new("https://public.opendatasoft.com")
    coordinates_response = coordinates_conn.get("/api/records/1.0/search/?dataset=us-zip-code-latitude-and-longitude&q=#{params[:zip]}")
    coordinates_json = JSON.parse(coordinates_response.body, symbolize_names: true)
    coordinates_data = {}
    coordinates_data[:latitude] = coordinates_json[:records][0][:fields][:latitude]
    coordinates_data[:longitude] = coordinates_json[:records][0][:fields][:longitude]

    ph_conn = Faraday.new("https://rest.soilgrids.org")
    ph_response = ph_conn.get("/soilgrids/v2.0/properties/query?lon=#{coordinates_data[:longitude]}&lat=#{coordinates_data[:latitude]}&property=phh2o")
    ph_json = JSON.parse(ph_response.body, symbolize_names: true)
    # ph_data = ph_json[:properties][:layers][0][:depths][1][:values][:mean].to_f / 10
    ph_json.to_json
  end
end
