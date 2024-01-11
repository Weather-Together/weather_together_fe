require 'capybara/rspec'

RSpec.describe 'Public Show Page', type: :feature, js: true do
  before do
    OmniAuth.config.add_mock(:google, {
      uid: '123',
      info: { email: 'st@gmail.com' },
      credentials: { token: 'mock_token', expires_at: Time.now + 1.day }
    })
  end

  it 'renders the public game page' do
    visit '/login'

    click_link 'Login with Google'

    visit '/community_round'

    expect(page).to have_css('#map')
    expect(page).to have_css('#right-column')
  end
end
