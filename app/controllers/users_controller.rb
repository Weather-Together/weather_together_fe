class UsersController < ApplicationController
  def new; end
  
  def create
    new_user = User.new(user_params)
    service = UsersService.new

    if user_params[:password] != user_params[:password_confirmation]
      flash[:error] = "Passwords do not match"
      redirect_to "/users/new"
    else
      # It would probably be more efficient to have a post endpoint /users/:email so we don't have an additional handshake here
      user_info = service.get_url("/users/#{new_user.email}")
      service.post_url("/users/#{user_info[:id]}", user_params)
      session[:user_id] = user_info[:id]
      flash[:success] = "Welcome, #{new_user.name}!"
      redirect_to "/rounds/public"
    # else
    #   flash[:error] = new_user.errors.full_messages.to_sentence
    #   redirect_to "/users/new"
    end
  end

  def login_form; end

  def login
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private 
  
  def user_params 
    params.permit(:name, :email, :password, :password_confirmation)
  end 
end
