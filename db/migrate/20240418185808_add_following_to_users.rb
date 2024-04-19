class AddFollowingToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :follower, foreign_key: { to_table: :users }
  end
end
