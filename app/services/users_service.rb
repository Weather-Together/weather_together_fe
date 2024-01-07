class UsersService
  def conn
    conn = Faraday.new(url: 'http://localhost:3000/')
  end
  
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def post_url(url, info)
    response = conn.post(url, info, "Content-Type" => "application/json")
  end

  def round_id
    get_url("/rounds/current")[:id]
  end

  # This will need to be changed to a get I think
  def send_login_info
    post_url("/users/#{params[:user_email]}")[:id]
  end
end
