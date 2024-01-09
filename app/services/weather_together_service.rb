class WeatherTogetherService
  def conn
    # conn = Faraday.new(url: ' https://weather-together-be.onrender.com/api/v0/')
    conn = Faraday.new(url: 'http://localhost:3000/api/v0/')
  end

  def get_response(url)  
    JSON.parse(conn.get(url), symbolize_names: true)
  end

  def post_response(url, info)
    response = conn.post(url, info, "Content-Type" => "application/json")
  end
end