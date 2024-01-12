require 'rails_helper'

RSpec.feature 'Navbar', type: :feature do
  # def log_in(email, password)
  #   visit login_path
  #   save_and_open_page
  #   fill_in 'Email', with: email
  #   fill_in 'Password', with: password
  #   first(:button, 'Login').click
  # end

  before do
    OmniAuth.config.add_mock(:google, {
      uid: '123',
      info: { email: 'st@gmail.com' },
      credentials: { token: 'mock_token', expires_at: Time.now + 1.day }
    })

    visit '/login'
    click_link 'Login with Google'
  end

  it 'renders the navbar correctly for logged in user' do
    expect(page).to have_css('.nav-container')
    expect(page).to have_css('.navbar')
    expect(page).to have_link(href: '/community_round')
    expect(page).to have_link('Logout', visible: true)
    expect(page).to have_link('Dashboard', visible: true)
    expect(page).to have_link('Community Round', visible: true)

    click_link 'Logout'

    expect(page).to have_css('.nav-container')
    expect(page).to have_css('.navbar')
    expect(page).to have_link(href: '/')
    expect(page).to have_link('New User', visible: true)
    expect(page).to have_link('Login', visible: true)
  end
end