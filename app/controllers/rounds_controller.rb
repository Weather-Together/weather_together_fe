class RoundsController < ApplicationController
  # before_action :require_login, only: [:public_show]

  def public_show
    facade = RoundsFacade.new
    @target_weather_data = facade.target_weather_data
  end

  def submit_vote
    round_id = ReceivingService.new.current_round[:data][:id]
    
    vote_info = {
      latitude: params[:latitude],
      longitude: params[:longitude]
    }

    SendingService.new.send_vote(round_id, vote_info)
  end


  # private

  # def require_login
  #   unless session[:user_id]
  #     flash[:error] = 'You must be logged in to access this page.'
  #     redirect_to login_path
  #   end
  # end
end
