class RoundsController < ApplicationController
  # before_action :require_login, only: [:public_show]

  def public_show
    @target_weather_data = RoundsFacade.new.target_weather_data
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


  # private

  # def require_login
  #   unless session[:user_id]
  #     flash[:error] = 'You must be logged in to access this page.'
  #     redirect_to login_path
  #   end
  # end
end
