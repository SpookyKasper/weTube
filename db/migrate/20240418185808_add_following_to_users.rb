class AddFollowingToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :follower, null: false, foreign_key: { to_table: :users }
  end
end
