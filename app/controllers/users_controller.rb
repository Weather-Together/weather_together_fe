class UsersController < ApplicationController
  before_action :require_login, only: [:show] # Might need to add other actions

  def show
    facade = RoundsFacade.new
    @previous_rounds = facade.previous_user_rounds(current_user_id)
    @current_round = facade.current_round_data
    @leaderboard_scores = facade.round_result_info
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
    redirect_to root_path
  end

  def login
    service = SendingService.new
    query = service.login_user(params[:email], params[:password])
    response = JSON.parse(query.body, symbolize_names: true)
    if response[:errors].first[:detail] == 'User must verify email'
      flash[:error] = 'User must verify email'
      redirect_to '/login'
    elsif response[:errors].first[:detail] == 'User must sign in through Google OAuth'
      flash[:error] = 'User must sign in through Google OAuth'
      redirect_to '/login'
    elsif response[:errors].first[:detail] == 'Email and/or password are incorrect'
      flash[:error] = 'Email and/or password are incorrect'
      redirect_to '/login'
    else
      session[:user_id] = response
      redirect_to '/community_round'
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
