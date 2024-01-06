class UsersController < ApplicationController
  def new; end
  
  def create
    user = User.new(params)
    service = UsersService.new

    if user[:password] != user[:password_confirmation]
      flash[:error] = "Passwords do not match"
      redirect_to "/users/new"
    else
      service.post_url("/users/#{}", "user params?")
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to "/rounds/public"
    # else  
    #   flash[:error] = new_user.errors.full_messages.to_sentence
    #   redirect_to register_path
    end 
  end

  def login_form; end

  def login
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  # private 
  
  # def user_params 
  #   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  # end 
end
