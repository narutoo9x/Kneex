# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

80.times do
	FoodItem.create!(name: Faker::Food.ingredient, price: Faker::Number.between(10000, 200000),
		section_id: Faker::Number.between(1, 4), description: Faker::Lorem.paragraph(2, true, 5))
end