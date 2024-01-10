class SendingService < WeatherTogetherService 
  def send_login_info(email)
    email = { email: email }.to_json
    conn.post('users/oauth_login', email, "Content-Type" => "application/json")
  end
  
  def send_vote(vote_info)
    post_response("/users/#{session[:user_id]}/rounds/#{round_id}", vote_info)
  end
end
