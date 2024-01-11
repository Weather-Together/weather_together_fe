require 'capybara/rspec'
require 'selenium-webdriver'

RSpec.describe 'Public Show Page', type: :feature, js: true do
  before do
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome)
    end
    Capybara.javascript_driver = :selenium
  end

  it 'renders the public game page' do
    visit '/community_round'

    expect(page).to have_css('#map')
    expect(page).to have_css('#right-column')
    # Add more expectations as needed
  end
end