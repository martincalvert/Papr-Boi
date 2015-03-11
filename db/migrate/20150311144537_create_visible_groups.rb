class CreateVisibleGroups < ActiveRecord::Migration
  def change
    create_table :visible_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
