class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name
      t.string :css, :limit => nil
      t.string :permission_group_id

      t.timestamps
    end
  end
end
