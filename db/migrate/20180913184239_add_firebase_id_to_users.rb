class AddFirebaseIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :string
    add_column :users, :firebase_id, :string
    add_column :users, :username, :string
  end
end
