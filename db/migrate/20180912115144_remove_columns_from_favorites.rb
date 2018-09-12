class RemoveColumnsFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :start_address
    remove_column :favorites, :end_address
  end
end
