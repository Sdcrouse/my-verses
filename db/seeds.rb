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
  last_name: "Peter",
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

# MyVerses
# John 3:16
MyVerse.create(
  verse_text: "For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life.",
  reason_liked: "This one verse sums up the ENTIRE message of Christianity. And it was spoken by Christ himself, no less!",
  version: "KJV", user: johnny, verse_reference: john316
)
MyVerse.create(
  verse_text: "For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life.",
  reason_liked: "These words spoken by our Lord indicate at least three things: 
                 that Jesus is the prophesied Messiah, 
                 that life after death will happen for those who believe, 
                 and that this promise - and God's love - extends to Jews AND Gentiles alike.",
  version: "KJV", user: paul, verse_reference: john316
)
MyVerse.create(
  verse_text: "For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life.",
  reason_liked: "This is the Gospel - the Good News - that can and should be shouted from the rooftops!",
  version: "KJV", user: peter, verse_reference: john316
)
MyVerse.create(
  verse_text: "For God so loved the world that he gave his one and only Son, that whoever believes in him shall not perish but have eternal life.",
  reason_liked: "This is my hope summed up in one verse.",
  version: "NIV", user: newguy, verse_reference: john316
)

# Genesis 1:1
MyVerse.create(
  verse_text: "In the beginning, God created the heavens and the earth",
  reason_liked: "This are the words that started it all - the creation of the earth itself.",
  version: "ESV", user: peter, verse_reference: gen1v1
)
MyVerse.create(
  verse_text: "In the beginning, God created the heavens and the earth",
  reason_liked: "For many reasons, this is the verse that I like to use to introduce Gentiles to the Holy Scriptures.",
  version: "ESV", user: paul, verse_reference: gen1v1
)
MyVerse.create(
  verse_text: "In the beginning God created the heavens and the earth.",
  reason_liked: "This is the first Bible verse I ever read, and the one that introduced me to God.",
  version: "NIV", user: newguy, verse_reference: gen1v1
)

# Psalm 117
MyVerse.create(
  verse_text: "Praise the LORD, all you nations; extol him, all you peoples.
               For great is his love toward us, and the faithfulness of the LORD endures forever. Praise the LORD.",
  reason_liked: "It is a good psalm of praise, and it is the shortest chapter in the Bible (only two verses).",
  version: "NIV", user: newguy, verse_reference: shortest_psalm
)