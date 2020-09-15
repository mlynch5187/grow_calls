class SoilGridService
  def find_ph(lon, lat)
    response = conn.get("/soilgrids/v2.0/properties/query?lon=#{lon}&lat=#{lat}&property=phh2o")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new("https://rest.soilgrids.org")
  end
end
