class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.text :info
      t.text :profile_picture_path
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
