class AddColumnsToSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :vehicle_type, :string
    add_column :steps, :credit_name, :string
    add_column :steps, :credit_url, :string
    add_column :steps, :travel_mode, :string
  end
end
