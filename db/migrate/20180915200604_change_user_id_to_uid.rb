class ChangeUserIdToUid < ActiveRecord::Migration[5.2]
  def change
    rename_column :itineraries, :user_id, :uid
  end
end
