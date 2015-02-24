class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :mustache, limit: nil
      t.string :fields
      t.string :permission_group_id

      t.timestamps
    end
  end
end
