class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:info] = 'User Created!'
      redirect_to "/users/edit/#{user.id}"
    else
      flash[:error] = 'User creation failed'
      redirect_to "new"
    end
  end

  def edit
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = User.find(session[:user_id])
    end
  end

  def update
    updates = params['user']
    user = User.find(updates['id'])
    if user.present?
      if user.update(user_params)
        flash[:info] = 'User Updated'
        redirect_to users_index_path
      else
        redirect_to "/users/edit/#{user.id}"
      end
    else
      redirect_to "/users/edit/#{user.id}"
    end
  end

  def destroy
    id = params[:user_id]
    user = User.find(id)
    if user.destroy
      flash[:warning] = 'User has been deleted'
    else
      flash[:error] = 'User was not deleted'
      redirect_to "/users/edit/#{id}"
    end
  end

private
  def user_params
    params.require(:user).permit(:email, :first, :last, :admin, :password)
  end
end
