class UsersService < ApplicationService
  def conn
    conn = Faraday.new(url: 'http://localhost:3000/')
  end
  
  def get_url(url)
    json_parse(conn.get(url))
  end

  def post_url(url, info)
    response = conn.post(url, info, "Content-Type" => "application/json")
  end

  def round_id
    get_url("/rounds/current")[:id]
  end

  # This will need to be changed to a get I think
  def send_login_info(email)
    post_url("/users/#{email}")[:id]
  end

  def previous_rounds
    get_url("/users/#{session[:user_id]}/recent_rounds")
  end

  def send_vote(vote_info)
    post_url("/users/#{session[:user_id]}/rounds/#{round_id}", vote_info)
  end

  def current_round
    get_url("/users/#{session[:user_id]}/rounds/current_community_round")
  end
end
