require 'capybara/rspec'
require 'selenium-webdriver'
require 'nokogiri'

RSpec.describe 'Results Page', type: :feature, js: true do
  before do
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome)
    end
    Capybara.javascript_driver = :selenium
  end

  
  xit 'renders the results page' do
    visit '/users/dashboard' # replace with the actual path
     OmniAuth.config.add_mock(:google, {
      uid: '123',
      info: { email: 'st@gmail.com' },
      credentials: { token: 'mock_token', expires_at: Time.now + 1.day }
    })
    sleep 1 
    doc = Nokogiri::HTML(page.body)

    expect(page).to have_content('Results')

    expect(page).to have_css('.navbar-brand', text: 'Logo Here')

    within '.col-md-6.bg-primary' do
      expect(page).to have_css('h2', text: "Today's Round")
      expect(page).to have_css('p', text: "Stats for today's public game")
    end

    within '.col-md-6.bg-secondary' do
      expect(page).to have_css('h2', text: "Personal Stats")
      expect(page).to have_css('p', text: "Stats from all games")
    end
  end
end