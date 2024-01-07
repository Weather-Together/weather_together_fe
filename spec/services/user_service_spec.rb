require 'rails_helper'

RSpec.describe UsersService, type: :service do
  before(:each) do
    @service = UsersService.new
  end
  
  describe 'User Service Instance Methods', :vcr do
    it '#conn, returns a Faraday object' do
      expect(@service.conn).to be_a(Faraday::Connection)
    end

    it '#get_url, returns hash data' do
      url = '/users/1/rounds/1'
      current_round = @service.get_url(url)

      expect(current_round).to be_a(Faraday::Response)
      # expect(current_round).to be_a(Hash)
    end
    
    it '#post_url, makes a successful post request' do
      url = '/users/samuelttran@gmail.com'
      info = { email: 'samuelttran@gmail.com' }
      response = @service.post_url(url, info)

      expect(response).to be_a(Faraday::Response)
      # expect(response.status) DO WE NEED
    end

    it '#round_id returns a hash with the current round id' do
      response = @service.round_id
    
      expect(response).to be_a(Hash)
      # Add actual data structure
      # expect(response[:id]).to be_a(Integer)
    end
  end
end