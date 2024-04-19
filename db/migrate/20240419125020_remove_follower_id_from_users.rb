class RemoveFollowerIdFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :follower_id
  end
end
