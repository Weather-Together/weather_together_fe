require 'rails_helper'

RSpec.describe 'Coordinates', :vcr do
  xscenario 'clicking on the map sends data to the server' do
    visit '/community_round' 

    # Assuming there is a map with an id 'map'
    page.execute_script("map.simulateClick({ lngLat: [-74.0060, 40.7128] })")

    # Wait for the AJAX request to complete (adjust as needed)
    expect(page).to have_text('Coordinates saved successfully', wait: 5)

    # You can also check the database or perform other assertions as needed
    expect(Vote.last.latitude).to eq(40.7128)
    expect(Vote.last.longitude).to eq(-74.0060)
  end

  describe 'POST #save' do
    xit 'creates a new vote with latitude and longitude' do
    
      coordinates_data = { latitude: -96.808891, longitude: -96.808891 }


      results = Vote.find_country(search_term)

      expect(results).to be_a(String)

      expect(response).to have_http_status(:success)
      expect(response.parsed_body['status']).to eq('Coordinates saved successfully')

      expect(Vote.last.latitude).to eq(40.7128)
      expect(Vote.last.longitude).to eq(-74.0060)
    end
  end
end