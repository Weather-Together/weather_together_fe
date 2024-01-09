require "rails_helper"

RSpec.describe Vote do
  xit "exists" do
    details = {
     # FILL IN WITH ENDPOINT
    }

    vote = Vote.new(details)

    expect(vote).to be_a Vote
    expect(vote.attribute).to be_a DataType
  end
end