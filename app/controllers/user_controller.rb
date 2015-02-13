class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
    @user = User.find(params[:user_id])
  end

  def destroy
    @user = User.find(params[:user_id])
    if @user.destroy!
      flash[:info] = 'User account has been deleted!'
    else
      flash[:error] = 'User account was not deleted!'
    end
  end

end
