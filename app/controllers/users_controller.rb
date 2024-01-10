class UsersController < ApplicationController
  # before_action :require_login, only: [:show]

  def show
    facade = RoundsFacade.new
    @previous_rounds = facade.previous_user_rounds
    @current_round = facade.current_round_data
  end

  # private

  # def require_login
  #   unless session[:user_id]
  #     flash[:error] = 'You must be logged in to access this page.'
  #     redirect_to login_path
  #   end
  # end
end
