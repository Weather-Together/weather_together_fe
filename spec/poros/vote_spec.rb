require "rails_helper"

RSpec.describe Vote do
  it "exists" do
    details = {
      vote_id: 1,
      user_id: 1,
      round_id: 1,
      status: "active",
      target_weather_stats: { temperature: 25, humidity: 60 },
      latitude: 40.7128,
      longitude: -74.0060,
      weather_stats: { temperature: 22, humidity: 55 },
      score: 10
    }

    vote = Vote.new(details)

    expect(vote).to be_a Vote
    expect(vote.id).to eq(1)
    expect(vote.user_id).to eq(1)
    expect(vote.round_id).to eq(1)
    expect(vote.status).to eq("active")
    expect(vote.target_weather_stats).to eq({ temperature: 25, humidity: 60 })
    expect(vote.lat).to eq("40.71280")
    expect(vote.lon).to eq("-74.00600")
    expect(vote.weather_stats).to eq({ temperature: 22, humidity: 55 })
    expect(vote.score).to eq(10)
  end
end
