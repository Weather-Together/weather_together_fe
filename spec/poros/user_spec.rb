require "rails_helper"

RSpec.describe User do
  xit "exists" do
    details = {
     # FILL IN WITH ENDPOINT
    }

    user = User.new(details)

    expect(user).to be_a User
    expect(user.id).to be_a Integer
    expect(user.email).to be_a String
  end
end