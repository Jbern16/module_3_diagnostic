require 'rails_helper'

RSpec.feature "user can search zip code on root path" do
  scenario "when they search for zip code they are brought to /search?zip-x and see 10 closest stations default to 6 miles" do
    VCR.use_cassette("nrel/zipcodes", record: :new_episodes) do

    visit "/"

    within("nav") do
      fill_in :q, with: "11733"
      click_on "Locate"
    end

    expect(current_path).to eq '/search'

    within(".stations") do
      expect(page).to have_content "STONY BROOK UNV"
      expect(page).to have_content "24 hours daily"
      expect(page).to have_content "ELEC"
      expect(page).to have_content "NY"
      expect(page).to have_content "Stony Brook"
      end
    end
  end
end
