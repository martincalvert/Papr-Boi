class RevolverController < ApplicationController
  def login
    user = params['user']
    User.where
  end

  def logout
    session[:user_id] = nil
    redirect_to '/login'
  end

  def index
  end

end
