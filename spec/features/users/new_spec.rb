RSpec.describe "User Registration" do
  it 'can create a user with a name and unique email' do
    visit register_path
    fill_in 'Username', with: 'User One' # Adjust the identifier to match your form field
    fill_in 'Email', with:'user1@example.com' # Adjust the identifier to match your form field
    fill_in 'Password', with:'password123' # Adjust the identifier to match your form field
    fill_in 'Password confirmation', with:'password123' # Adjust the identifier to match your form field
    click_button 'Create New User'

    expect(current_path).to eq('/')
  end
end