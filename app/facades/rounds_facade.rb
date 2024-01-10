class RoundsFacade
  def target_weather_data
    service = ReceivingService.new
    response = service.current_round
    current_round = Round.new(response[:data][:attributes])

    JSON.parse(current_round[:target_weather_stats], symbolize_names: true)[:weather_data]
  end

  def previous_user_rounds
    service = ReceivingService.new
    response = service.previous_rounds

    response.map do |previous_round|
      Round.new(previous_round)
    end
  end

  def current_round_data
    service = ReceivingService.new
    response = service.current_round
    Round.new(response)
  end
end