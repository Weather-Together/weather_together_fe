class Rounds::VotesController < ApplicationController
  def index
    service = UsersService.new
    @previous_rounds_info = service.previous_rounds(current_user_id)
  end
end
