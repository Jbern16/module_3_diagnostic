class Station < OpenStruct


  def self.service
    NrelService.new
  end

  def self.all(zip_code)
    raw_stations = service.nearby_stations(zip_code)
    raw_stations.map do |station|
      Station.new(station)
    end
  end

end
