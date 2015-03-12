class RevolverController < ApplicationController
  skip_before_action :authorize, only: [:index,:login]
  def login
    user = User.find_by_email(params['email'])
    if user && user.authenticate(params['password'])
      session[:user_id] = user.id
      session[:first] = user.first
      session[:last] = user.last
      redirect_to revolver_welcome_path
    else
      redirect_to revolver_index_path
    end
  end

  def logout
    session[:last] = nil
    session[:first] = nil
    session[:user_id] = nil
    redirect_to revolver_index_path
  end

  def index
    if session[:user_id].present? && session[:last].present? && session[:first].present?
      user = User.find(session[:user_id])
      if user.last == session[:last] && user.first == session[:first]
        redirect_to revolver_welcome_path
      end
    end
  end

end
