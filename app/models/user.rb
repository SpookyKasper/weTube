class User < ApplicationRecord
  has_many :posts
  has_many :followers, class_name: 'User', foreign_key: 'follower_id'
  belongs_to :following, class_name: 'User'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    user || User.create(name: data['name'], email: data['email'], password: Devise.friendly_token[0, 20])
  end
end


