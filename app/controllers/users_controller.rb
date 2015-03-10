class UsersController < ApplicationController
  before_action :verify_admin, except: [:edit, :update]

  def verify_admin
    unless @current_user.admin
      flash[:error] = 'Only admins can view that content sorry!'
      redirect_to revolver_welcome_path
    end
  end

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
    if params[:id] && @current_user.admin
      @user = User.find(params[:id])
    else
      @user = User.find(session[:user_id])
    end
  end

  def update
    updates = params['user']
    user = User.find(updates['id'])
    if user.present? && user.update(user_params)
        flash[:info] = 'User Updated'
        if @current_user.admin
          redirect_to users_index_path
        else
          redirect_to revolver_welcome_path
        end
    else
      flash[:error] = 'User was not updated!'
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
