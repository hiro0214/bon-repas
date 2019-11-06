class AddColumnServingsToFood < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :servings, :string, null: false
  end
end
