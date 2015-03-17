class BuilderController < ApplicationController
  before_filter :check_role

  def check_role
    unless session[:roles].include? 3
      flash[:error] = 'You do not have permission to create an email!'
      redirect_to revolver_index_path
    end
  end

  def new_email
    @sections = Array.new
    Section.visible_groups(current_groups).each_with_index do |s,i|
      temp = {}
      temp['name'] = s.name
      temp['fields'] = s.fields
      temp['id'] = i
      @sections << temp
    end
    @styles = Array.new
    Style.visible_groups(current_groups).each_with_index do |s,i|
      temp = {}
      temp['name'] = s.name
      temp['fields'] = s.fields
      temp['id'] = i
      @styles << temp
    end
  end

  def build
    css = params[:css][:name]
    @email = String.new
    if params[:css][:fields].present?
      params[:css][:fields].each do |k,v|
        style = Style.where(name: css).first.css
        fields = {}
        v.each do |key, value|
          fields[key] = value
        end
      temp_str = Mustache.render(style,fields)
      @email << "<style>#{temp_str}</style>"
      @email << "\n<!-- Module Break -->\n"
      end
    else
      @email << "<style>#{Style.where(name: css).first.css}</style>\n"
    end

    modules = params[:modules]
    modules.each do |k,v|
      section = Section.where(name: v['type']).first.mustache
      fields = {}
      v[:fields].each do |key, value|
        name = value.keys.join('')
        val = value[name]
        fields[name] = val
      end
      @email << Mustache.render(section,fields)
      @email << "\n<!-- Module Break -->\n"
    end
    render 'preview'
  end

  def to_file
    email = params[:email]
    send_data email, filename: "email_#{Time.now.to_s.underscore}.html", type: 'text/html'
  end
end
