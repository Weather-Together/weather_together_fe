require "rails_helper"

RSpec.describe User do
  it "exists" do
    details = {
      id: 1,
      email: "user@example.com"
    }

    user = User.new(details)

    expect(user).to be_a User
    expect(user.id).to be_a Integer
    expect(user.email).to be_a String
  end
end
