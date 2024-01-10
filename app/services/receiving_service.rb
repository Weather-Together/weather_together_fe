class ReceivingService < WeatherTogetherService 
  def previous_rounds
    get_response("/users/#{session[:user_id]}/recent_rounds")
  end

  def current_round
    get_response("/users/#{session[:user_id]}/rounds/current_community_round")
  end
end