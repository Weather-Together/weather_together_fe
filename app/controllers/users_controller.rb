class UsersController < ApplicationController
  def show
    # service = UsersService.new
    # @previous_rounds_info = service.previous_rounds
  end

  def login
    # service = UsersService.new
    # id = service.send_login_info
    id = 1
    session[:user_id] = id
    redirect_to '/rounds/public'
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end
