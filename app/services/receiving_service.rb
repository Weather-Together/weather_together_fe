class ReceivingService < WeatherTogetherService 
  # NEW NAME CHECK
  def previous_rounds
    # get_url('/users/31/recent_rounds')
    get_response('/users/31/recent_rounds')
  end

  def current_round
    # get_url('/users/31/rounds/current_community_round')
    get_response('/users/31/rounds/current_community_round')
  end
end