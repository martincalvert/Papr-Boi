class StylesController < ApplicationController
  def index
    @styles = Style.all
  end

  def edit
    @style = Style.find(params[:id])
  end

  def update
    style = Style.find(params[:style_id])
    if style.present? && style.update(style_params)
      flash[:info] = 'CSS Pack updated!'
      redirect_to styles_index_path
    else
      flash[:error] = 'CSS Pack not updated'
      redirect_to "/styles/edit/#{style.id}"
    end
  end

  def new
    @style = Style.new
  end

  def create
    style = Style.new(style_params)
    if style.save
      flash[:info] = 'CSS Pack Created'
      redirect_to styles_index_path
    else
      flash[:error] = 'CSS Pack Creation failed'
      redirect_to styles_edit_path
    end
  end

  def destroy
    style = Style.find(params[:id])
    if style.destroy
      flash[:info] = 'CSS Pack was deleted!'
      redirect_to styles_index_path
    else
      flash[:error] = 'CSS Pack was not deleted'
      redirect_to '/styles/edit/style.id'
    end
  end

private
  def style_params
    params.require(:style).permit(:name, :css, :fields)
  end

end
