require 'spec_helper'
require_relative '../../app/poros/vote'

RSpec.describe Vote do
  let(:details) do
  {
    vote_id: 1,
    user_id: 2,
    round_id: 3,
    status: 'active',
    target_weather_stats: { temperature: 25, humidity: 60 }.to_json,
    latitude: 37.7749,
    longitude: -122.4194,
    weather_stats: { temperature: 23, humidity: 55 }.to_json,
    score: 10
  }
end

  subject { described_class.new(details) }

  it 'has the correct attributes' do
    # expect(subject.id).to eq(1)
    expect(subject.user_id).to eq(2)
    expect(subject.round_id).to eq(3)
    expect(subject.status).to eq('active')
    expect(subject.target_weather_stats).to eq({ temperature: 25, humidity: 60 })
    expect(subject.lat).to eq('37.77490')
    expect(subject.lon).to eq('-122.41940')
    expect(subject.weather_stats).to eq({ temperature: 23, humidity: 55 })
    expect(subject.score).to eq("10.00")
  end
end

