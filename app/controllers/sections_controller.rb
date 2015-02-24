class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    section = Section.find(params[:id])
    if section.present? && section.update(section_params)
      flash[:info] = 'Module updated!'
      redirect_to sections_index_path
    else
      flash[:error] = 'Module was not updated'
      redirect_to "/sections/edit/#{section.id}"
    end
  end

  def new
    @section = Section.new
  end

  def create
    section = Section.new(section_params)
    if section.save
      flash[:info] = 'Module created!'
      redirect_to "/sections/edit/#{section.id}"
    else
      flash[:error] = 'Module not created'
      redirect_to sections_new_path
    end
  end

  def destroy
    section = Section.find(params[:id])
    if section.destroy
      flash[:info] = 'Module was deleted!'
      redirect_to sections_index_path
    else
      flash[:error] = 'Module deletion failed'
      redirect_to "/sections/edit/#{section.id}"
    end
  end

private
  def section_params
    params.require(:section).permit(:name, :mustache, :fields, :permission_group_id)
  end
end
