# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Creating 10 fake restaurants...'

10.times do
  restaurant = Restaurant.create!(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: %w(chinese italian japanese french belgian).sample
  )

  3.times do
    Review.create!(
      restaurant: restaurant,
      rating: rand(0..5),
      content: Faker::Restaurant.review
    )
  end
end

puts 'Created #{Restaurant.count} restaurants with its reviews'
