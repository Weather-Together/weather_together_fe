class UsersController < ApplicationController
  before_action :require_login, only: [:show] # Might need to add other actions

  def show
    facade = RoundsFacade.new
    @previous_rounds = facade.previous_user_rounds(current_user_id)
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
    # This should be changed
    redirect_to root_path
  end

  def login
    service = SendingService.new
    id = service.login_user(params[:email], params[:password]) # dig for id if needed
    if #success
      session[:user_id] = id
      redirect_to '/community_round'
    else
      flash[:error] = 'Invalid login, please try again'
      redirect_back
    end
  end

  private

  def require_login
    unless session[:user_id]
      flash[:error] = 'You must be logged in to access this page.'
      redirect_to login_path
    end
  end
end
