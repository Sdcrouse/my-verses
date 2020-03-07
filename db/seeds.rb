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

# VerseReferences 
# (Note: Here, I used #find_or_create_by because I already had some of these VerseReferences in my database.)
john316 = VerseReference.find_or_create_by(book: "John", chapter: "3", verse_start: "16")
gen1v1 = VerseReference.find_or_create_by(book: "Genesis", chapter: "1", verse_start: "1")
shortest_psalm = VerseReference.find_or_create_by(book: "Psalm", chapter: "117")
trust_in_god = VerseReference.find_or_create_by(book: "Proverbs", chapter: "3", verse_start: "5", verse_end: "6")
plans_in_heart = VerseReference.find_or_create_by(book: "Proverbs", chapter: "19", verse_start: "21")
gentle_answer = VerseReference.find_or_create_by(book: "Proverbs", chapter: "15", verse_start: "1")
psalm100 = VerseReference.find_or_create_by(book: "Psalm", chapter: "100")
love_chapter = VerseReference.find_or_create_by(book: "1 Corinthians", chapter: "13", verse_start: "4", verse_end: "8")
through_a_glass = VerseReference.find_or_create_by(book: "1 Corinthians", chapter: "13", verse_start: "12")

