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

    it '#send_login_info returns a hash with user id' do
      # Stub for params[:user_email]
      allow_any_instance_of(ActionController::Parameters).to receive(:[]).with(:user_email).and_return('test@example.com')
      
      response = @service.send_login_info
    
      expect(response).to be_a(Hash)
      # Add actual data structure
    end

    it '#previous_rounds returns a hash with previous round info' do
      # Stub for session[:user_id]
      allow_any_instance_of(ActionController::Base).to receive(:session).and_return(user_id: 123)
      response = @service.previous_rounds

      expect(response).to be_a(Hash)
      # Add actual data structure
    end

    it '#send_vote is hard to test' do
      # Need to figure out the response for this one from BE (after handshake?)
    end

    it '#current_round returns a hash with detailed info for the current round' do
      # Stub for session[:user_id]
      allow_any_instance_of(ActionController::Base).to receive(:session).and_return(user_id: 123)
      response = @service.current_round

      expect(response).to be_a(Hash)
      # Add actual data structure
    end
  end
end