class CreatePossibleRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :possible_routes do |t|
      t.references :favorite, foreign_key: true
      t.string :departure_time
      t.string :arrival_time
      t.string :duration
      t.string :distance
    end
  end
end
