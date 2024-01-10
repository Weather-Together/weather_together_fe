class RoundsController < ApplicationController
  # before_action :require_login, only: [:public_show]

  def public_show
    facade = RoundsFacade.new
    @target_weather_data = facade.target_weather_data
  end

  def submit_vote
    service = SendingService.new
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
