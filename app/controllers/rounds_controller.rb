class RoundsController < ApplicationController
  def public_show
    service = UsersService.new
    response = service.current_round
    current_round_info = Round.new(response[:data][:attributes])
    current_round_info = JSON.parse(current_round_info.body, symbolize_names: true)
    @target_weather_data = current_round_info.target_weather_stats[:weather_data]
  end

  # Refactor this to make less API calls (store round in session?)
  def submit_vote
    service = UsersService.new
    vote_info = {
      latitude: params[:latitude],
      longitude: params[:longitude]
    }
    service.send_vote(vote_info)
  end
end
