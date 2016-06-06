class NrelService

  def initialize
    @connection = Faraday.new("'https://api.data.govn/nrel")
  end

  def get(location)
    @connection.get do |req|
      req.url "/api/alt-fuel-stations/v1/nearest"
      req.params["api_key"] = ENV["nrel_key"]
      req.params["format"] = "json"
      req.params["location"] = location
  end

  def nearby_stations
  end

  def parse(reponse)
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

end
