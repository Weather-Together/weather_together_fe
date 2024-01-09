class UsersService < ApplicationService #DEPRECIATE LATER
  def conn
    conn = Faraday.new(url: 'http://localhost:3000/api/v0/')
  end
  
  def get_url(url)
    json_parse(conn.get(url))
  end

  def post_url(url, info)
    response = conn.post(url, info, "Content-Type" => "application/json")
  end

  # This will need to be changed to a get I think
  def send_login_info(email)
    post_url("/users/#{email}", email)[:id]
  end

  def previous_rounds
    get_url("/users/31/recent_rounds")
  end

  def send_vote(vote_info)
    post_url("/users/31/rounds/#{round_id}", vote_info)
  end

  def current_round
    get_url("/users/31/rounds/current_community_round")
  end
end
