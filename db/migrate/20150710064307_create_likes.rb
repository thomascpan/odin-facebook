class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :likable_id
      t.string :likable_type
      t.references :user

      t.timestamps null: false
    end
  end
end
