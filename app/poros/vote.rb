class Vote
  attr_reader :id, 
              :email

  def initialize(details)
    @id = details[:vote_id]
    @user_id = details[:user_id]
    @round_id = details[:round_id]
    @status = details[:status]
    @target_weather_stats = details[:target_weather_stats]
    @latitude = details[:latitude]
    @longitude = details[:longitude]
    @weather_stats = details[:weather_stats]
    @score = details[:score]
  end
end
