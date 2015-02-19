class BuilderController < ApplicationController
  def new_email
    @modules = Modules.where(permission_group_ids: params[:permission_group_ids])
    @styles = Styles.where(permission_group_ids: params[:permission_group_ids])
  end

  def build
    @email = ''
    render 'preview'
  end
end
