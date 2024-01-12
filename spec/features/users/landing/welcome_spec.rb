require 'rails_helper'

RSpec.feature 'Welcome page' do
  it 'User visits the homepage' do
    visit root_path

    #expect(page).to have_content('Welcome to Weather Together')
    using_wait_time(5) do
      expect(page).to have_link('Login', visible: false) # Use have_link instead of have_button
    end
    expect(page).to have_link('New User')
   

    click_link 'Login'
    expect(page).to have_current_path('/login')

    visit root_path

    click_link 'New User'
    expect(page).to have_current_path('/users/new')
  end
end