class User < ApplicationRecord
  has_one :profile
  has_many :posts
  has_many :likes
  has_many :following_users, foreign_key: :followee_id, class_name: 'Following'
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Following'
  has_many :followers, through: :following_users
  has_many :followees, through: :followed_users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    user || user = User.create(name: data['name'], email: data['email'], password: Devise.friendly_token[0, 20])
    user
  end
end
