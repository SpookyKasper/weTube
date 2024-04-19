class RenameFollowedIdToFolloweeIdInFollowings < ActiveRecord::Migration[7.1]
  def change
    rename_column :followings, :followed_id, :followee_id
  end
end
