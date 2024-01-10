class ReceivingService < WeatherTogetherService 
  def previous_rounds
    # where id is the current session id
    get_response("users/#{session[:user_id]}/recent_rounds")
  end

  def current_round
    get_response('rounds/current_community_round')
  end
end
