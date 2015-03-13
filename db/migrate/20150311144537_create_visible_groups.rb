class CreateVisibleGroups < ActiveRecord::Migration
  def change
    create_table :visible_groups do |t|
      t.string :name

      t.timestamps
    end
    add_column :sections, :visible_group_ids, :integer, array: true
    add_column :styles, :visible_group_ids, :integer, array: true
    rename_column :users, :visible_groups, :visible_group_ids
  end
end
