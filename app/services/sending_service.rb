class SendingService < WeatherTogetherService 
  def send_login_info(email)
    email = { email: email }.to_json
    conn.post('users/oauth_login', email, "Content-Type" => "application/json")
  end
  
  def send_vote(round_id, vote_info)
    conn.post("users/#{session[:user_id]}/rounds/#{round_id}/votes/new", vote_info.to_json, "Content-Type" => "application/json")
  end
end
