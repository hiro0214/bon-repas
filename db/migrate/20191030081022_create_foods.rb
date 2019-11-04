class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.references :user, foreign_key: true, null: false
      t.string :food_name, null: false
      t.string :text, null: false
      t.string :material, null: false
      t.string :category_id, null: false
      t.integer :goods_count
      t.timestamps
    end
  end
end
