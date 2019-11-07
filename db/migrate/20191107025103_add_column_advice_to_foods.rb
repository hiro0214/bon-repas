class AddColumnAdviceToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :advice, :string
  end
end
