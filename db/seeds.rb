# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "My movies..."
Movie.destroy_all
Movie.create name:"Lord of the Rings", director: "Peter Jackson", image:"aaa", description:"xxx"
Movie.create name:"Kill Bill", director: "Quentin Taratino", image:"bbb", description:"yyy"

puts "Created #{Movie.all.length} movies."

puts "Done"