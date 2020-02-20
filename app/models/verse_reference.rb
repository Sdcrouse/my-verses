class VerseReference < ApplicationRecord
  validates :book, presence: true

  validates :chapter, presence: true, inclusion: { within: "1".."150", 
    message: "must be a number between 1 and 150" }
    # The Bible does not have any chapter numbers lower than 1.
    # The Book of Psalms has the greatest number of chapters: 150.

  validates :verse_start, 
    inclusion: { within: "1".."176", message: "must be a number between 1 and 176" }, 
    allow_blank: true
    # Verses in the Bible start at 1 and (in Psalm 119, the chapter with the most verses) end at 176.
  
  validates :verse_start, 
    presence: { message: "can't be blank unless verse end is blank" },
    unless: -> { verse_end.blank? }
    # Proverbs 3:5 and Proverbs 3:5-6 are valid verse_references, but Proverbs 3: -6 is not.
   
  # If there's a way to combine the above two validations for the verse_start attribute, I haven't found it yet.
  # Ultimately, my goal is to require that the verse_start is present when the verse_end is present,
  # And that the verse_start, when given, is between 1 and 176 even when the verse_end is blank.

  def book=(book)
    # Instead of validating for a titleized book, 
    # I will convert it to one here.
    
    # write_attribute(:book, book.downcase.titleize) # This works.
    super(book.downcase.titleize) # But this is the Rails way to do it.
  end
end
