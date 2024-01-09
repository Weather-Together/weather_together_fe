class RoundFacade
  def target_weather_data
    service = ReceivingService.new
    response = service.current_round
    current_round = Round.new(response[:data][:attributes])

    JSON.parse(current_round[:target_weather_stats], symbolize_names: true)[:weather_data]
  end
end