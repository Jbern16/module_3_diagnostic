require 'rails_helper'

RSpec.feature "user can search zip code on root path" do
  scenario "when they search for zip code they are brought to /search?zip-x and see 10 closest stations default to 6 miles" do
    VCR.use_cassette("nrel/zipcodes") do

    visit "/"

    within("nav") do
      fill_in :q, with: "80203"
      click_on "Locate"
    end

    expect(current_path).to eq '/search?zip=80203'

    end
  end
end
