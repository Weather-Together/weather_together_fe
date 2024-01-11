class RoundsController < ApplicationController
  before_action :require_login, only: [:public_show]

  def public_show
    facade = RoundsFacade.new
    @target_weather_data = facade.target_weather_data
  end

  def submit_vote
    round_id = ReceivingService.new.current_round[:data][:id]

    vote_info = {
      lat: params[:latitude],
      lon: params[:longitude]
    }

    SendingService.new.send_vote(round_id, vote_info, current_user_id)

    flash[:success] = 'Successfully submitted, you can vote again until the end of the day!'
    redirect_to users_dashboard_path  # TEMP FOR NOW
  end


  private

  def require_login
    unless session[:user_id]
      flash[:error] = 'You must be logged in to access this page.'
      redirect_to login_path
    end
  end
end
