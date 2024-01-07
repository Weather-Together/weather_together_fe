class Rounds::VotesController < ApplicationController
  def index
    @previous_rounds_info = get_previous_rounds
  end

  def get_previous_rounds
    service = UsersService.new
    service.get_url("/users/#{session[:user_id]}/recent_rounds")
  end
end
