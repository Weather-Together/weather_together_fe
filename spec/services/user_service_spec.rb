require 'rails_helper'

RSpec.describe UsersService, type: :service do
  describe 'User Service Instance Methods', :vcr do
    it '#conn, returns a Faraday object' do
      service = UsersService.new

      expect(service.conn).to be_a(Faraday::Connection)
    end

    it '#get_url, returns hash data' do
      url = '/users/1/rounds/1'
      current_round = UsersService.new.get_url(url)

      expect(current_round).to be_a(Faraday::Response)
    end
    
    it '#post_url, makes a successful post request' do
      url = '/users/samuelttran@gmail.com'
      info = { email: 'samuelttran@gmail.com' }
      response = UsersService.new.post_url(url, info)

      expect(response).to be_a(Faraday::Response)
      # expect(response.status) DO WE NEED
    end

    
  end
end