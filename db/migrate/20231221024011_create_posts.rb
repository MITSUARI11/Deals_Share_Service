class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.integer :user_id, null: false
      t.integer :shop_genre, null: false
      t.string :shop_name, null: false
      t.string :address, null: false
      t.text :posting_text, null: false

      t.timestamps
    end
  end
end
