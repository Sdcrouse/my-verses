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
  reason_liked: "These words spoken by our Lord indicate at least three things: that Jesus is the prophesied Messiah,
  that life after death will happen for those who believe, and that this promise - and God's love - extends to Jews AND Gentiles alike.",
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

# Proverbs 3:5-6
MyVerse.create( # Note: This is worded a little differently from when I first learned it; evidently, the NIV has changed over the years.
  verse_text: "Trust in the LORD with all your heart and lean not on your own understanding;
  in all your ways submit to him, and He will make your paths straight.",
  reason_liked: "This is one of my all-time favorite verses, a classic reminder to always trust our God.",
  version: "NIV", user: newguy, verse_reference: trust_in_god
)
MyVerse.create(
  verse_text: "Trust in the LORD with all thine heart; and lean not unto thine own understanding.
  In all thy ways acknowledge him, and he shall direct thy paths.",
  reason_liked: "The Lord has given me the things I need: the sun and rain and an appleseed. So, why NOT trust in Him?",
  version: "KJV", user: johnny, verse_reference: trust_in_god
)

# Proverbs 19:21
MyVerse.create(
  verse_text: "Many are the plans in the mind of a man, but it is the purpose of the LORD that will stand.",
  reason_liked: "This has proven true for me plenty of times. Who but the Lord would have thought that I would be a fisherman one day, and a 'fisher of men' the next?",
  version: "ESV", user: peter, verse_reference: plans_in_heart
)
MyVerse.create(
  verse_text: "Many are the plans in the mind of a man, but it is the purpose of the LORD that will stand.",
  reason_liked: "I have lost count as to how many times this has proven true for me!
  Once, I tried to preach in one part of the earth, only to be directed in a dream to another.
  And more importantly, I was once one of the worst persecutors of the brothers, only to encounter Jesus himself and actually LEAD them!",
  version: "ESV", user: paul, verse_reference: plans_in_heart
)
MyVerse.create(
  verse_text: "Many are the plans in a person's heart, but it is the LORD's purpose that prevails.",
  reason_liked: "My life in a nutshell. Need I say more?", version: "NIV", user: newguy, verse_reference: plans_in_heart
)

# Proverbs 15:1
MyVerse.create(
  verse_text: "A gentle answer turns away wrath, but a harsh word stirs up anger.",
  reason_liked: "Alas, this is a lesson I have had to learn many times. James and John may be the 'Sons of Thunder', but I have quite the temper, too!",
  version: "NIV", user: peter, verse_reference: gentle_answer
)

# Psalm 100
MyVerse.create(
  verse_text: "A Psalm of thanksgiving. 
  Make a joyful noise to the LORD, all the earth. Serve the LORD with gladness; come into His presence with joyful songs.
  Know that the LORD is God. It is He who made us, and we are His; we are His people, and the sheep of His pasture.
  Enter His gates with thanksgiving and His courts with praise; give thanks to Him and bless His name.
  For the LORD is good, and His loving devotion endures forever; His faithfulness continues to all generations.",
  version: "Berean Study Bible", user: newguy, verse_reference: psalm100
)