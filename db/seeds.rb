# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

emails = ['jean@pierre.com', 'andy@klein.com', 'peak@time.com', 'kevin@costner', 'mark@iration.com']
passwords = %w[labonne kleinlein bigparty movieactor dubwise]
names = %w[jean andy peak kevin mark]

5.times do |i|
  User.find_or_create_by!(email: emails[i]) do |user|
    user.password = passwords[i]
    user.password_confirmation = passwords[i]
    user.name = names[i]
  end
end
