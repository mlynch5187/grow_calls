require 'faraday'

def OpenDataService
  def get_coords(zip)
    response = conn.get("/api/records/1.0/search/?dataset=us-zip-code-latitude-and-longitude&q=#{zip}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new("https://public.opendatasoft.com")
  end
end
