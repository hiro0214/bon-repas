class CreateFoodstuffs < ActiveRecord::Migration[5.2]
  def change
    create_table :foodstuffs do |t|
      t.references :food, foreign_key: true, null: false
      t.string :material, null: false
      t.string :amount, null: false
      t.timestamps
    end
  end
end
