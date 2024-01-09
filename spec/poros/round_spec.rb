require "rails_helper"

RSpec.describe Round do
  xit "exists" do
    details = {
     # FILL IN WITH ENDPOINT
    }

    round = Round.new(details)

    expect(round).to be_a Round
    expect(round.close_date).to be_a String
    expect(round.number_ofvotes).to be_a Integer
    expect(round.status).to be_a Integer
    expect(round.game_id).to be_a Integer
    expect(round.votes).to be_a Array 
  end
end