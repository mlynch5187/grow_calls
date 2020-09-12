# class OpenDataService
#   def conn
#     Faraday.new("https://public.opendatasoft.com/api/records/1.0/search")
#   end
#
#   def latitude_longitude(query)
#     response = conn.get("/?dataset=us-zip-code-latitude-and-longitude&q=#{query}")
#     json = JSON.parse(response.body, symbolize_names: true)
#     data = {}
#     data[latitude] = json[:records][:latitude]
#     data[longitude] = json[:records][:longitude]
#     data
#   end
# end
