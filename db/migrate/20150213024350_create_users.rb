class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :password_digest
      t.string :permission_group_ids
      t.boolean :admin

      t.timestamps
    end
  end
end
