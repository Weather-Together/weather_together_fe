require 'rails_helper'

RSpec.feature 'Show', type: :feature do
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user_id).and_return(1)
    allow_any_instance_of(WeatherTogetherService).to receive(:get_response).and_return({ key: 'value' }) # replace with your expected response
    allow_any_instance_of(ReceivingService).to receive(:previous_rounds).and_return({ 
      data: [{ 
        attributes: { 
          close_date: '2022-01-01', 
          target_weather_stats: {}, 
          status: 'open', 
          votes: [] 
        } 
      }] 
    }) # replace with your expected response
    allow_any_instance_of(ReceivingService).to receive(:current_round).and_return({ 
      data: { 
        attributes: { 
          close_date: '2022-01-01', 
          target_weather_stats: {}, 
          status: 'open', 
          votes: [] 
        } 
      } 
    }) # replace with your expected response
  end

  xit 'renders the show page correctly' do
    visit '/users/dashboard'

    expect(page).to have_css('.container-fluid')
    expect(page).to have_content( "Today's Game")
    expect(page).to have_content("Personal Stats")
    # Check for the presence of the vote details
    expect(page).to have_content('Vote #1')
    expect(page).to have_content('Latitude:')
    expect(page).to have_content('Longitude:')
  end
end