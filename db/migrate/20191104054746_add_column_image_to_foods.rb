class AddColumnImageToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :image, :string, null: false
  end
end
