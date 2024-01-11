class ReceivingService < WeatherTogetherService 
  def previous_rounds
    get_response("users/#{session[:user_id]}/recent_rounds")
  end

  def current_round
    get_response('rounds/current_community_round')
  end

  def authenticate_user(id, token)
    get_response("users/#{id}/verify_account/#{token}")
  end
end
