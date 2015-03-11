class AddUserRole < ActiveRecord::Migration
  def change
    add_column :users, :roles, :integer, array: true
    add_column :users, :visible_groups, :integer, array: true
  end
end
