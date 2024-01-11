require 'spec_helper'
require_relative '../../app/poros/user'

RSpec.describe User do
  describe '#initialize' do
    it 'sets the id and email' do
      details = { id: 1, email: 'test@example.com' }
      user = User.new(details)

      expect(user.id).to eq(1)
      expect(user.email).to eq('test@example.com')
    end
  end
end

