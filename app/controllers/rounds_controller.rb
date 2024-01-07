class RoundsController < ApplicationController
  def public_show
    @current_round_info = get_current_round
  end

  # Refactor this to make less API calls (store round in session?)
  def submit_vote
    service = UsersService.new
    round_id = service.get_url("/rounds/current")[:id]
    vote_info = {
      latitude: params[:latitude],
      longitude: params[:longitude]
    }
    service.post_url("/users/#{session[:user_id]}/rounds/#{round_id}", vote_info)
  end

  def get_current_round
    service = UsersService.new
    round_id = service.get_url("/rounds/current")[:id]
    service.get_url("/users/#{session[:user_id]}/rounds/#{round_id}")
  end
end
