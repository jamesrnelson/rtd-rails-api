class ChangeFirebaseIdToUserId < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :username
    remove_column :users, :firebase_id
    add_column :users, :uid, :string
  end
end
