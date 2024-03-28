class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :parking, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.text :introduction, null: false
      t.timestamps
    end
  end
end
