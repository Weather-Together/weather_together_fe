class ReceivingService < WeatherTogetherService 
  def previous_rounds(user_id)
    get_response("users/#{user_id}/recent_rounds")
  end

  def current_round
    get_response('rounds/current_community_round')
  end

  def authenticate_user(id, token)
    get_response("users/#{id}/verify_account/#{token}")
  end

  def round_results
    get_response('rounds/most_recent/results')
  end
end
