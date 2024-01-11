require 'rails_helper'

RSpec.feature 'Navbar', type: :feature do
  def log_in(email, password)
    visit login_path
    save_and_open_page
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    first(:button, 'Login').click
  end

  xit 'renders the navbar correctly for logged in user' do
    log_in('test@example.com', 'password') # replace with actual user credentials

    visit some_path # replace with a path that renders the view including the navbar

    expect(page).to have_css('.nav-container')
    expect(page).to have_css('.navbar')
    expect(page).to have_link(href: '/')
    expect(page).to have_css('img[src*="logo.png"]')
    expect(page).to have_button('Logout', visible: false)
    expect(page).to have_button('Dashboard', visible: false)
    expect(page).to have_button('Community Round', visible: false)
  end

  xit 'renders the navbar correctly for logged out user' do
    visit some_path # replace with a path that renders the view including the navbar

    expect(page).to have_css('.nav-container')
    expect(page).to have_css('.navbar')
    expect(page).to have_link(href: '/')
    expect(page).to have_css('img[src*="logo.png"]')
    expect(page).to have_button('New User', visible: false)
    expect(page).to have_button('Login', visible: false)
  end
end