RSpec.describe "User Registration" do
  it 'can create a user with a name and unique email' do
    visit register_path

    fill_in 'Username', with: 'User One' # Adjust the identifier to match your form field
    fill_in 'Email', with:'user1@example.com' # Adjust the identifier to match your form field
    fill_in 'Password', with:'password123' # Adjust the identifier to match your form field
    fill_in 'Password confirmation', with:'password123' # Adjust the identifier to match your form field
    click_button 'Create New User'

    expect(current_path).to eq('/community_round')
  end 

  it 'does not create a user if email isnt unique' do 
    visit register_path

    fill_in 'Username', with: 'User One' # Adjust the identifier to match your form field
    fill_in 'Email', with:'notunique@example.com' # Adjust the identifier to match your form field
    fill_in 'Password', with:'password123' # Adjust the identifier to match your form field
    fill_in 'Password confirmation', with:'password123' # Adjust the identifier to match your form field
    click_button 'Create New User'

    visit register_path
    
    fill_in 'Username', with: 'User Two' # Adjust the identifier to match your form field
    fill_in 'Email', with:'notunique@example.com' # Adjust the identifier to match your form field
    fill_in 'Password', with:'password123' # Adjust the identifier to match your form field
    fill_in 'Password confirmation', with:'password123' # Adjust the identifier to match your form field
    click_button 'Create New User'

    expect(current_path).to eq(register_path)
    expect(page).to have_content("Email has already been taken")
  end

  it 'does not create a user if password and password confirmation do not match' do
    visit register_path

    fill_in 'Username', with: 'User One' # Adjust the identifier to match your form field
    fill_in 'Email', with:'user1@example.com' # Adjust the identifier to match your form field
    fill_in 'Password', with:'password123' # Adjust the identifier to match your form field
    fill_in 'Password confirmation', with:'otherpassword5' # Adjust the identifier to match your form field
    click_button 'Create New User'

    expect(current_path).to eq(register_path)
    expect(page).to have_content("Passwords do not match")
  end
end