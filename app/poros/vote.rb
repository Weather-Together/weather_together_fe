class Vote
  attr_reader :latitude, :longitude, :user_id
  def initialize(lat, lon)
    @user_id = 1
    @latitude = lat
    @longitude = lon
  end
end