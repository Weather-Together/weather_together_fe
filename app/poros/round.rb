class Round
  attr_reader :close_date,
              :target_weather_stats,
              :status,
              :votes
              
  def initialize(details, vote_data)
    @close_date = details[:close_date]
    @target_weather_stats = details[:target_weather_stats]
    @status = details[:status]
    @votes = vote_data
  end
end
