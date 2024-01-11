class UsersController < ApplicationController
  # before_action :require_login, only: [:show]

  def show
    facade = RoundsFacade.new
    @previous_rounds = facade.previous_user_rounds(session[:user_id])
    @current_round = facade.current_round_data
  end

  def verify
    service = ReceivingService.new
    response = service.authenticate_user(params[:user_id], params[:token])
    if response[:message] == 'Successfully verified user'
      flash[:success] = 'Successfully Verified'
      session[:user_id] = params[:user_id]
      redirect_to '/community_round'
    else
      flash[:error] = 'Email does not match verification token'
      redirect_to root_path
    end
  end

  def register
    service = SendingService.new
    service.register_user(params[:username], params[:email], params[:password], params[:password_confirmation])
  end

  # private

  # def require_login
  #   unless session[:user_id]
  #     flash[:error] = 'You must be logged in to access this page.'
  #     redirect_to login_path
  #   end
  # end
end
