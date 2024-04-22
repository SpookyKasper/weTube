class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true, length: { minimum: 10 }
end
