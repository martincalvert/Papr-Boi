class BuilderController < ApplicationController
  def new_email
    @modules = Modules.all
    @styles = Styles.all
  end

  def build
    @email = ''
    render 'preview'
  end
end
