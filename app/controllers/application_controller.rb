class ApplicationController < ActionController::Base
  def current_user_id
    session_body = JSON.parse(session[:user_id]["body"], symbolize_names: true)
    session_body[:data][:id]
  end
end
