class WeatherTogetherService
  def conn
    # conn = Faraday.new(url: 'localhost:3000/api/v0/')
    conn = Faraday.new(url: 'https://weather-together-be.onrender.com/api/v0/')
  end

  def get_response(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  # OUTDATED
  # def post_response(url, info)
  #   response = conn.post(url, info, "Content-Type" => "application/json")
  # end
end
