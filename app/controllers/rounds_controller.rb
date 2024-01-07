class RoundsController < ApplicationController
  def public_show
    service = UsersService.new
    @current_round_info = service.current_round
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
