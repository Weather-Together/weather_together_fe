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
end
