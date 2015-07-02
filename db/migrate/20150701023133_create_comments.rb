class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :content
    	t.references :post
    	t.references :user

      t.timestamps null: false
    end
    add_index :comments, :post_id
  end
end
