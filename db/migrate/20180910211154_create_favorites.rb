class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :start_address
      t.string :end_address
    end
  end
end
