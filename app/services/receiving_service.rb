class ReceivingService < WeatherTogetherService 
  def previous_rounds
    get_response("users/4/recent_rounds")
  end

  def current_round
    get_response('rounds/current_community_round')
  end
end
