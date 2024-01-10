class RoundsFacade
  def target_weather_data
    service = ReceivingService.new
    response = service.current_round[:data][:attributes]
    votes = response[:votes]
    current_round = Round.new(response, vote_data(votes))
    eval(current_round.target_weather_stats)[:weather_data] # Unstringifies nested json
  end

  def previous_user_rounds(user_id)
    service = ReceivingService.new
    response = service.previous_rounds[:data] # Array of last three rounds
    last_three_rounds = response.map do |round|
      details =  {
        round_id: round[:id],
        close_date: round[:attributes][:close_date],
        target_weather_stats: round[:attributes][:target_weather_stats],
        status: round[:attributes][:status]
      }

      vote = round[:attributes][:votes].select { |vote| vote[:user_id] == user_id }
      Round.new(details, vote_data(vote))
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

