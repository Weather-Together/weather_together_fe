class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    service = SendingService.new
    id = service.send_login_info(auth_hash[:info][:email])
    session[:user_id] = id
    redirect_to '/community_round'
  end

  def destroy
    # session.delete(:user_id)
    session[:user_id] = nil
    redirect_to root_path
    flash[:success] = 'You have successfully logged out'
  end
end
