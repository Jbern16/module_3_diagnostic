class NrelService

  def initialize
    @connection = Faraday.new("https://developer.nrel.gov")
  end

  def get_stations(location, distance)
    @connection.get do |req|
      req.url "/api/alt-fuel-stations/v1/nearest"
      req.params["api_key"] = ENV["nrel_key"]
      req.params["format"] = "json"
      req.params["location"] = location
      req.params["limit"] = "10"
      req.params["fuel_type"] = "ELEC, LPG"
      req.params["radius"] = distance
    end
  end

  def nearby_stations(zip_code, distance="6")
    distance = "6" if distance == ""
    parse(get_stations(zip_code, distance))
  end

  def parse(response)
    parsed = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

end
