class ReceivingService < WeatherTogetherService 
  def previous_rounds
    get_response('/users/31/recent_rounds')
  end

  def current_round
    get_response('/users/31/rounds/current_community_round')
  end
end