RSpec.describe "get stations" do
  it "has the info we want" do
    VCR.use_cassette("nrel/service") do

      stations = Station.all("11733", "")

      expect(stations.count).to eq 10

      station = stations.first

      expect(station).to respond_to :station_name
      expect(station).to respond_to :street_address
      expect(station).to respond_to :state
      expect(station).to respond_to :city
      expect(station).to respond_to :fuel_type_code
      expect(station).to respond_to :distance
      expect(station).to respond_to :access_days_time
    end
  end
  it "has the info we want scoped to distance" do
    VCR.use_cassette("nrel/service_with_distance") do
      stations = Station.all("11733", "1")

      expect(stations.count).to eq 0

    end
  end
end
