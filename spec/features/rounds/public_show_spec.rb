require 'capybara/rspec'
require 'selenium-webdriver'

RSpec.describe 'Public Show Page', type: :feature, js: true do
  before do
    OmniAuth.config.add_mock(:google, {
      uid: '123',
      info: { email: 'st@gmail.com' },
      credentials: { token: 'mock_token', expires_at: Time.now + 1.day }
    })
  end

  it 'renders the public game page' do
    visit '/login'
    click_link 'Login with Google'
    visit '/community_round'

    expect(page).to have_css('#map')
    expect(page).to have_css('#right-column')
    expect(page).to have_css('#gridContainer')

    expect(page).to have_css('#gridHeader', text: 'High Temperature (°F)')
    expect(page).to have_css('#gridHeader', text: 'Low Temperature (°F)')
    expect(page).to have_css('#gridHeader', text: 'Average Humidity (%)')
    expect(page).to have_css('#gridHeader', text: 'Max Wind Speed (mph)')
    expect(page).to have_css('#gridHeader', text: 'Precipitation (inches)')

    expect(page).to have_css('#markerInfoContainer')
    expect(page).to have_css('#latitude', text: 'Latitude:')
    expect(page).to have_css('#longitude', text: 'Longitude:')

    expect(page).to have_css('#submitButtonContainer')
    expect(page).to have_button('Submit')
  end

  # xit 'places a marker and submits the form' do
  #   Capybara.register_driver :selenium do |app|
  #     Capybara::Selenium::Driver.new(app, browser: :chrome)
  #   end
  #   Capybara.javascript_driver = :selenium

  #   page.execute_script('map.fire("click", { lngLat: [-73.935242, 40.730610] })')

  #   expect(page).to have_content('-73.935242')
  #   expect(page).to have_content('40.730610')

  #   click_button 'Submit'
  #   expect(page).to have_content('Successfully submitted')
  # end
end
