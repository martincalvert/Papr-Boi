class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to revolver_index_path unless current_user
  end

  def current_groups
    groups = @current_user.reload.visible_group_ids
  end
  helper_method :current_groups

  def self.visible_groups
    self.class.constantize.where("ARRAY#{current_groups} && visible_group_ids")
  end
end
