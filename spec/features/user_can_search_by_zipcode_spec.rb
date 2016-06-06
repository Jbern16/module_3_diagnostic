require 'rails_helper'

feature "user can search zip code on root path" do
  describe "when they search for zip code they are brought to /search?zip-x and see 10 closest stations default to 6 miles" do
    VCR.use_cassette("nrel/zipcodes") do

      visit root_path

      fill_in "Zip Code" with: "80203"

      click_on "Locate"

      expect(current_path).to eq '/search?zip=80203'
    end
  end
end
