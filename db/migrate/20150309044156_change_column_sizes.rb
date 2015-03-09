class ChangeColumnSizes < ActiveRecord::Migration
  def up
    change_column :styles, :css, :text
    change_column :sections, :mustache, :text
    change_column :sections, :fields, :text
  end

  def down
  end
end
