require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  it 'renders the login form correctly' do
    visit login_path

    expect(page).to have_css('.container')
    expect(page).to have_css('h2', text: 'Login')
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
    expect(page).to have_button('Login')
    expect(page).to have_link('Login with Google', href: '/auth/google_oauth2')
    expect(page).to have_link('Create a new Google account', href: 'https://accounts.google.com/signup')
  end
end