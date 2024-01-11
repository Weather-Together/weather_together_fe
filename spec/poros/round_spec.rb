require 'spec_helper'
require_relative '../../app/poros/round'

RSpec.describe Round do
  let(:details) { { close_date: '2022-01-01', target_weather_stats: { temperature: 25, humidity: 50 }, status: 'open' } }
  let(:vote_data) { [1, 2, 3] }

  subject { described_class.new(details, vote_data) }

  describe '#initialize' do
    it 'sets the close_date' do
      expect(subject.close_date).to eq('2022-01-01')
    end

    it 'sets the target_weather_stats' do
      expect(subject.target_weather_stats).to eq({ temperature: 25, humidity: 50 })
    end

    it 'sets the status' do
      expect(subject.status).to eq('open')
    end

    it 'sets the votes' do
      expect(subject.votes).to eq([1, 2, 3])
    end
  end
end
