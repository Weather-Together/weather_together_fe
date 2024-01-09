class UsersController < ApplicationController
  # before_action :require_login, only: [:show]

  def show
    service = UsersService.new
    @previous_rounds_info = service.previous_rounds
  end

  # private

  # def require_login
  #   unless session[:user_id]
  #     flash[:error] = 'You must be logged in to access this page.'
  #     redirect_to login_path
  #   end
  # end
end
