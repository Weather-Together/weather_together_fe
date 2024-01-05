require 'rails_helper'

RSpec.describe "User Registration" do
  it 'can create a user with a name and unique email' do
    visit register_path

    fill_in :user_name, with: 'User One'
    fill_in :user_email, with:'user1@example.com'
    fill_in :user_password, with:'password123'
    fill_in :user_password_confirmation, with:'password123'
    click_button 'Create New User'

    expect(current_path).to eq('/rounds/public')
    # expect(page).to have_content("user one's Dashboard")
  end 

  it 'does not create a user if email isnt unique' do 
    User.create(name: 'User One', email: 'notunique@example.com', password: 'password123', password_confirmation: 'password123')

    visit register_path
    
    fill_in :user_name, with: 'User Two'
    fill_in :user_email, with:'notunique@example.com'
    fill_in :user_password, with:'password123'
    fill_in :user_password_confirmation, with:'password123'
    click_button 'Create New User'

    expect(current_path).to eq(register_path)
    expect(page).to have_content("Email has already been taken")
  end

  it 'does not create a user if password and password confirmation do not match' do
    visit register_path

    fill_in :user_name, with: 'User One'
    fill_in :user_email, with:'user1@example.com'
    fill_in :user_password, with:'password123'
    fill_in :user_password_confirmation, with:'otherpassword5'
    click_button 'Create New User'

    expect(current_path).to eq(register_path)
    expect(page).to have_content("Passwords do not match")
  end
end