class UsersService
  def conn
    conn = Faraday.new(url: 'http://localhost:3000/')
  end
  
  def get_url(url)
    json_parse(conn.get(url))
  end

  def post_url(url, info)
    response = conn.post(url, info)
  end
end
