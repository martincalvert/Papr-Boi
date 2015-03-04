class RemovePermGroups < ActiveRecord::Migration
  def change
    remove_column :sections, 'permission_group_id'
    remove_column :styles, 'permission_group_id'
    remove_column :users, 'permission_group_ids'
  end
end
