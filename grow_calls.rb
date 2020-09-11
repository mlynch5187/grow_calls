require 'sinatra'
require 'pry'
require 'faraday'
require './opendata_service.rb'

# class GrowCalls < Sinatra::Base
  get '/' do
    'Grow Calls API'
  end

  get '/ph' do
    content_type :json
    conn = Faraday.new("https://public.opendatasoft.com")
    response = conn.get("/api/records/1.0/search/?dataset=us-zip-code-latitude-and-longitude&q=#{params[:zip]}")
    json = JSON.parse(response.body, symbolize_names: true)
    data = {}
    data[:latitude] = json[:records][0][:fields][:latitude]
    data[:longitude] = json[:records][0][:fields][:longitude]
    data

    conn_2 = Faraday.new("")
  end
