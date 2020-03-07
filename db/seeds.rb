# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users:
johnny = User.create(
  username: "johnny.appleseed",
  email: "jchapman@penn.edu",
  first_name: "John",
  last_name: "Chapman",
  password: "orchards"
)

paul = User.create(
  username: "pauloftarsus",
  email: "p.apostle@israel.com",
  password: "righteousnessByFaith"
)

peter = User.create(
  username: "simonpeter",
  email: "s.peter@gmail.com",
  first_name: "Simon",
  last_name: "Peter"
  password: "fishersofmen"
)

newguy = User.create(username: "NewConvert", email: "loremipsum@dolorsit.amet", password: "pw")

