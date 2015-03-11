class AddCssFields < ActiveRecord::Migration
  def change
    add_column :styles, :fields, :text
  end
end
