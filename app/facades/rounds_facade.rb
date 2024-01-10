class RoundsFacade
  def target_weather_data
    service = ReceivingService.new
    response = service.current_round[:data][:attributes]
    votes = response[:votes]
    current_round = Round.new(response, vote_data(votes))
    eval(current_round.target_weather_stats)[:weather_data]
  end

  def previous_user_rounds
    service = ReceivingService.new
    response = service.previous_rounds[:data]

    response.each do |previous_round|
      Round.new(previous_round[:attributes], vote_data(previous_round[:attributes][:votes]))
    end
  end

  def current_round_data
    service = ReceivingService.new
    response = service.current_round[:data][:attributes]
    votes = response[:votes]
    Round.new(response, vote_data(votes))
  end

  def vote_data(data)
    data.map do |vote|
      Vote.new(vote)
    end
  end
end
