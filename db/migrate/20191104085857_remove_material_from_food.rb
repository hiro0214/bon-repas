class RemoveMaterialFromFood < ActiveRecord::Migration[5.2]
  def change
    remove_column :foods, :material, :string
  end
end
