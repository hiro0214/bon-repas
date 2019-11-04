class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.references :food, foreign_key: true, null: false
      t.string :process, null: false
      t.timestamps
    end
  end
end
