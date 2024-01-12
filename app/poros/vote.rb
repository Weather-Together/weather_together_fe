class Vote
  attr_reader :id, 
              :user_id,
              :round_id,
              :status,
              :target_weather_stats,
              :lat,
              :lon,
              :weather_stats,
              :score,
              :username

  def initialize(details)
    @user_id = details[:user_id]
    @round_id = details[:round_id]
    @status = details[:status]
    @target_weather_stats = JSON.parse(details[:target_weather_stats], symbolize_names: true)
    @lat = format("%.5f", details[:latitude].to_f)
    @lon = format("%.5f", details[:longitude].to_f)
    if details[:weather_stats].present?
      @weather_stats = JSON.parse(details[:weather_stats], symbolize_names: true)
    else 
      @weather_stats = details[:weather_stats]
    end
    if details[:score].present?
      @score = format("%.2f", details[:score].to_f)
    end
    @username = details[:username]
  end
end