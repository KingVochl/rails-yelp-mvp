# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Restaurant.destroy_all
Review.destroy_all
balan_deli = { name: "Balan Deli", category: "italian", phone_number: "0145-548739", address: "Balanstraße" }

mami = { name: "Hotel Mutter", category: "chinese",phone_number: "0145-5485539", address: "At home" }

wencke = { name: "Besemer", category: "french", phone_number: "0145-565739", address: "Tutzing" }

hin = { name: "Hin und Weg", category: "french", phone_number: "0145-648739", address: "Hauptstraße" }

mccs = { name: "Mc Donalds", category: "belgian", phone_number: "0145-788739", address: "Starnberg" }



[balan_deli, mami, wencke, hin, mccs].each do |attributes|
  restaurant = Restaurant.create!(attributes)

  nice = { rating: 4, content: "War geil", restaurant: restaurant}
  shit = { rating: 2, content: "Geht besser", restaurant: restaurant}
  puts "Created #{restaurant.name}"
  [nice, shit].each do |rev|
    review = Review.create!(rev)
    puts "#{restaurant.name}: #{review.content}"
  end
end
