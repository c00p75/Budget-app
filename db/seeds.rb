# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.find_or_create_by(name: 'Food') do |category|
  category.icon = 'https://w7.pngwing.com/pngs/140/347/png-transparent-grocery-store-shopping-list-food-icon-a-bag-of-food-text-hand-service-thumbnail.png'
end

Category.find_or_create_by(name: 'Transport') do |category|
  category.icon = 'https://w7.pngwing.com/pngs/394/716/png-transparent-bus-stop-train-public-transport-bus-service-public-transport-blue-angle-text-thumbnail.png'
end

Category.find_or_create_by(name: 'Healthcare') do |category|
  category.icon = 'https://w7.pngwing.com/pngs/50/589/png-transparent-ochsner-health-system-clinic-medicine-hospital-health-care-healthcare-logo-medicine-hospital-thumbnail.png'
end

Category.find_or_create_by(name: 'Entertainment') do |category|
  category.icon = 'https://w7.pngwing.com/pngs/573/1018/png-transparent-white-tv-illustration-television-android-tv-logo-old-tv-love-text-rectangle-thumbnail.png'
end
