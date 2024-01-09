class SendingService < WeatherTogetherService 
  def send_login_info(email)
    post_response("/users/#{email}", email)[:id]
  end
  
  def send_vote(vote_info)
    post_response("/users/31/rounds/#{round_id}", vote_info)
  end
end