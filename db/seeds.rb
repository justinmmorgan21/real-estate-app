# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Home.create(
#   description: "beautiful ranch home in rural texas",
#   year_built: 1925,
#   square_feet: 1600,
#   bedrooms: 3,
#   bathrooms: 1.5,
#   floors: 1,
#   availability: "for sale",
#   address: "123 ABC St Gunther, TX 70000",
#   price: 399000
# )

# Home.create(
#   description: "updated condo in the heart of the Dallas art district",
#   year_built: 1987,
#   square_feet: 1100,
#   bedrooms: 2,
#   bathrooms: 2,
#   floors: 2,
#   availability: "pending",
#   address: "456 XYZ Ave Dallas, TX 70001",
#   price: 445000
# )

# Home.create(
#   description: "massive state-of-the-art estate in the up and coming town of Prosper",
#   year_built: 2023,
#   square_feet: 6000,
#   bedrooms: 5,
#   bathrooms: 5,
#   floors: 2,
#   availability: "for sale",
#   address: "1 Paradise Cir Propser, TX 70002",
#   price: 2799000
# )
puts Geocoder.search("Paris")