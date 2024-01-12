require 'rails_helper'

RSpec.feature 'Navbar', type: :feature do
  def log_in(email, password)
    visit login_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    first(:button, 'Login').click
  end

  xit 'renders the navbar correctly for logged in user' do
    log_in('test@example.com', 'password') # replace with actual user credentials

    visit "/community_round" # replace with a path that renders the view including the navbar

    expect(page).to have_css('.nav-container')
    expect(page).to have_css('.navbar')
    expect(page).to have_link(href: '/')
    expect(page).to have_link('Logout')
    expect(page).to have_link('Dashboard')
    expect(page).to have_link('Community Round')
  end

  it 'renders the navbar correctly for logged out user' do
    visit "/" # replace with a path that renders the view including the navbar

    expect(page).to have_css('.nav-container')
    expect(page).to have_css('.navbar')
    expect(page).to have_link(href: '/')
    expect(page).to have_link('New User', visible: false)
    expect(page).to have_link('Login', visible: false)
  end
end