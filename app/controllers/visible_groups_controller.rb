class VisibleGroupsController < ApplicationController
  def index
    @visible_groups = VisibleGroup.all
  end

  def edit
    @visible_group = VisibleGroup.find(params[:id])
  end

  def update
    visible_group = VisibleGroup.find(params[:id])
    if visible_group.present? && visible_group.update(visible_group_params)
      flash[:info] = 'Visible Group updated!'
      redirect_to visible_groups_index_path
    else
      flash[:error] = 'Visible Group was not updated'
      redirect_to "/visible_groups/edit/#{section.id}"
    end
  end

  def new
    @visible_group = VisibleGroup.new
  end

  def create
    visible_group = VisibleGroup.new(visible_group_params)
    if visible_group.save
      flash[:info] = 'Visible Group created!'
      redirect_to visible_groups_index_path
    else
      flash[:error] = 'Visible Group not created'
      redirect_to visible_groups_new_path
    end
  end

  def destroy
    visible_group = VisibleGroup.find(params[:id])
    if visible_group.destroy
      flash[:info] = 'Visible Group was deleted!'
      redirect_to visible_groups_index_path
    else
      flash[:error] = 'Visible Group deletion failed'
      redirect_to "/visible_groups/edit/#{visible_group.id}"
    end
  end

private
  def visible_group_params
    params.require(:visible_group).permit(:name)
  end
end
