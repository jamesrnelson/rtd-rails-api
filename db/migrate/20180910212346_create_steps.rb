class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.references :possible_route, foreign_key: true
      t.string :headsign
      t.string :arrival_time
      t.string :departure_time
      t.string :arrival_stop
      t.string :departure_stop
      t.string :name
      t.string :short_name
      t.string :instructions
      t.string :distance
      t.string :duration
      t.string :color
      t.integer :num_stops
    end
  end
end
