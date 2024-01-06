class UsersController < ApplicationController
  def new; end
  
  def create
    user = User.new(params)

    if user[:password] != user[:password_confirmation]
      flash[:error] = "Passwords do not match"
      redirect_to register_path
    elsif new_user.save
      flash[:success] = "Welcome, #{new_user.name}!"
      redirect_to user_path(new_user)
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
