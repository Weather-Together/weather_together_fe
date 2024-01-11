require 'rails_helper'

RSpec.feature 'Application layout', type: :feature do
  xit 'renders the layout correctly' do
    visit root_path
    metas = page.all('meta[name="viewport"]', visible: false)
    
    expect(metas.any? { |meta| meta[:content] == "width=device-width,initial-scale=1" }).to be true

    expect(page).to have_title('WeatherTogethrtFe')
    expect(page).to have_css('meta[name="csrf-token"]')
    expect(page).to have_css('meta[name="csp-nonce"]')
    expect(page).to have_css('link[rel="stylesheet"][href*="application"]')
    expect(page).to have_css('script[src*="bootstrap.min.js"]')
    expect(page).to have_css('script[src*="jquery-3.5.1.slim.min.js"]')
    expect(page).to have_css('script[src*="popper.min.js"]')

    

    within('body') do
      expect(page).to have_content('Flash message')
      expect(page).to have_selector('div.alert')
    end

    expect(page).to have_selector('body > *')
  end
end
