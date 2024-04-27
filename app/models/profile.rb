class Profile < ApplicationRecord
  belongs_to :user

  validates :info, presence: true, length: { minimum: 10 }
  validates :profile_picture_path, presence: true
end
