require 'rails_helper'

RSpec.feature 'Welcome page' do
  xit 'User visits the homepage' do
    visit root_path

    #expect(page).to have_content('Welcome to Weather Together')
    expect(page).to have_button('Login')
    expect(page).to have_button('New User')
    expect(page).to have_css('img[src*="logo.png"]')
    expect(page).to have_css('img[src*="how_to.png"]')

    click_link 'Log In'
    expect(page).to have_current_path('/login')

    visit root_path

    click_link 'Create Account'
    expect(page).to have_current_path('/users/new')
  end
end