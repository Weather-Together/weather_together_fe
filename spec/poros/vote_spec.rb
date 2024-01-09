require "rails_helper"

RSpec.describe Vote do
  it "exists" do
    details = {
     # FILL IN WITH ENDPOINT
    }

    vote = Vote.new(details)

    expect(vote).to be_a Vote
    expect(cote.attribute).to be_a DataType
  end
end