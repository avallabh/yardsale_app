# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

item = Item.create!(name: 'Iphone', description: "cray cray", price: 30000, user_id: 1, location_id: 1, latitude: 42.3516303, longitude: -71.061417)
puts "Item #{item.id} created"

