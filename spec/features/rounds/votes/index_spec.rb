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

  it 'renders the results page' do
    visit '/users/dashboard' # replace with the actual path
    
    sleep 1 
    doc = Nokogiri::HTML(page.body)

    expect(doc.at('meta[name="viewport"][content="width=device-width, initial-scale=1.0"]')).not_to be_nil
    expect(doc.at('link[href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"]')).not_to be_nil

    expect(page).to have_title('Results')

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