require 'rails_helper'

RSpec.feature 'Show', type: :feature do
  it 'renders the show page correctly' do
    OmniAuth.config.add_mock(:google, {
      uid: '123',
      info: { email: 'st@gmail.com' },
      credentials: { token: 'mock_token', expires_at: Time.now + 1.day }
    })

    visit '/login'
    click_link 'Login with Google'
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