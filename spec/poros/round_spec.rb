require "rails_helper"

require "rails_helper"

RSpec.describe Round do
  it "exists" do
    details = {
      close_date: "2022-01-01",
      target_weather_stats: { temperature: 25, humidity: 60 },
      status: "active"
    }

    vote_data = [
      { user_id: 1, score: 10 },
      { user_id: 2, score: 8 },
    ]

    round = Round.new(details, vote_data)

    expect(round).to be_a Round
    expect(round.close_date).to be_a String
    expect(round.target_weather_stats).to eq({ temperature: 25, humidity: 60 })
    expect(round.status).to eq("active")
    expect(round.votes).to be_a Array
    expect(round.votes.length).to eq(vote_data.length)
  end
end

