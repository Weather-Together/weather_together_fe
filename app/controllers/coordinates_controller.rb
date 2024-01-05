class CoordinatesController < ApplicationController
  def self.save
    data = JSON.parse(request.body.read)

    # Access latitude and longitude
    latitude = data["latitude"]
    longitude = data["longitude"]

    # Initialize a new Vote instance with latitude and longitude
    @vote = Vote.new(latitude, longitude)

  end
end
