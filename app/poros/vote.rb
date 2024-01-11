class Vote
  attr_reader :id, 
              :user_id,
              :round_id,
              :status,
              :target_weather_stats,
              :lat,
              :lon,
              :weather_stats,
              :score

  def initialize(details)
    @id = details[:vote_id]
    @user_id = details[:user_id]
    @round_id = details[:round_id]
    @status = details[:status]
    @target_weather_stats = details[:target_weather_stats]
    @lat = format("%.5f", details[:latitude].to_f)
    @lon = format("%.5f", details[:longitude].to_f)
    @weather_stats = details[:weather_stats]
    @score = details[:score]
  end
end
