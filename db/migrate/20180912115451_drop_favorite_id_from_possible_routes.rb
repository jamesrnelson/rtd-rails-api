class DropFavoriteIdFromPossibleRoutes < ActiveRecord::Migration[5.2]
  def change
    remove_column :possible_routes, :favorite_id
  end
end
