class Vote
  attr_reader :id, 
              :user_id,
              :round_id,
              :status,
              :target_weather_stats,
              :lat,
              :lon,
              :weather_stats,
              :score,
              :username

  def initialize(details)
    @user_id = details[:user_id]
    @round_id = details[:round_id]
    @status = details[:status]
    @target_weather_stats = details[:target_weather_stats]
    @lat = format("%.5f", details[:latitude].to_f)
    @lon = format("%.5f", details[:longitude].to_f)

    if details[:weather_stats].present?
      @weather_stats = JSON.parse(details[:weather_stats], symbolize_names: true)
    else 
      @weather_stats = details[:weather_stats]
    end

    if details[:score].present?
      @score = format("%.2f", details[:score].to_f)
    end

    @username = details[:username]
require 'spec_helper'
require_relative '../../app/poros/vote'

RSpec.describe Vote do
  let(:details) do
    {
      vote_id: 1,
      user_id: 2,
      round_id: 3,
      status: 'active',
      target_weather_stats: { temperature: 25, humidity: 60 },
      latitude: 37.7749,
      longitude: -122.4194,
      weather_stats: { temperature: 23, humidity: 55 },
      score: 10
    }
  end

  subject { described_class.new(details) }

  it 'has the correct attributes' do
    expect(subject.id).to eq(1)
    expect(subject.user_id).to eq(2)
    expect(subject.round_id).to eq(3)
    expect(subject.status).to eq('active')
    expect(subject.target_weather_stats).to eq({ temperature: 25, humidity: 60 })
    expect(subject.lat).to eq('37.77490')
    expect(subject.lon).to eq('-122.41940')
    expect(subject.weather_stats).to eq({ temperature: 23, humidity: 55 })
    expect(subject.score).to eq(10)
  end
end

