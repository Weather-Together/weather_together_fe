class Round
  attr_reader :close_date,
              :number_of_votes,
              :target_weather_stats,
              :status,
              :game_id,
              :votes

  def initialize(details)
    @close_date = details[:close_date]
    @number_of_votes = details[:number_of_votes]
    @target_weather_stats = details[:target_weather_stats]
    @status = details[:status]
    @game_id = details[:game_id]
    @votes = details[:votes]
  end
end
