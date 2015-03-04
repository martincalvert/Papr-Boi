class BuilderController < ApplicationController
  def new_email
    sections = Section.all.only(:name,:fields)
    @sections = []
    sections.each do |s|
      temp = {}
      temp['name'] = s.name
      temp['fields'] = s.fields
      temp['id'] = s.id
      @sections << temp
    end
    @styles = Style.all
    @styles = @styles.map(&:name)
  end

  def build
    css = params[:css]
    modules = params[:modules]
    @email = Style.where(name: params['css']).first.css
    modules.each do |k,v|
      section = Section.find(v['type']).mustache
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
    binding.pry
    email = params[:email]
    send_data email, filename: "email_#{Time.now.to_s.underscore}.html", type: 'text/html'
  end
end
