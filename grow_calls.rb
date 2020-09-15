require 'sinatra/base'
require 'pry'
require './services/open_data_service'


class GrowCalls < Sinatra::Base
  # configure do
  #   set :raise_errors, true
  #   set :show_exceptions, false
  # end

  get '/' do
    'Grow Calls API'
  end

  get '/ph' do
    require "pry"; binding.pry
    content :json
    coords_search = OpenDataService.new
    coords_search.get_coords(params[:zip])
    coordinates_data = {}

    lat = coordinates_data[:latitude] = coordinates_json[:records][0][:fields][:latitude]
    lon = coordinates_data[:longitude] = coordinates_json[:records][0][:fields][:longitude]
    ph_search = SoilGridService.new
    json = ph_seach.find_ph(lon, lat)
    json.to_json
  end
end
