class UsersController < ApplicationController
  def new; end

  def show
    
  end
  
  def create
  end

  def login_form; end

  def login
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end
