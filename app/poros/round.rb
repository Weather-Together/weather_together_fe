class Round
  attr_reader :close_date,
              :number_of_votes,  # DO WE NEED
              :target_weather_stats,
              :status,
              :game_id,  # DO WE NEED
             
              :votes  # DO WE NEED
              

  def initialize(details)
    @close_date = details[:close_date]
    @target_weather_stats = details[:target_weather_stats]
    @status = details[:status]

    #  DO WE NEED THESE
    @votes = details[:votes]
    @number_of_votes = details[:number_of_votes]
    @game_id = details[:game_id]
  end
end
