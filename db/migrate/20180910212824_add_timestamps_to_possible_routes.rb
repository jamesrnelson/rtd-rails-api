class AddTimestampsToPossibleRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :possible_routes, :created_at, :datetime
    add_column :possible_routes, :updated_at, :datetime
  end
end
