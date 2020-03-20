class VerseReference < ApplicationRecord
  has_many :my_verses
  has_many :users, through: :my_verses

  validates :book, presence: true
  # Stretch goal idea: Make a BOOKS constant instead, then use it to create <option>s in a <datalist> on the MyVerse form.

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

  # This got tricky; I don't think I can use "inclusion", and "numericality" doesn't work with strings.
  validate :verse_end_must_be_greater_than_verse_start,
           :verse_end_can_only_be_176_or_lower

  def book=(book)
    # Instead of validating for a titleized book, 
    # I will convert it to one here.
    
    # write_attribute(:book, book.downcase.titleize) # This works.
    super(book.downcase.titleize) # But this is the Rails way to do it.
  end

  def verse_end_must_be_greater_than_verse_start
    if verse_end.present? && verse_end.to_i <= verse_start.to_i
      errors.add(:verse_end, "must be a number greater than verse start")
    end
  end

  def verse_end_can_only_be_176_or_lower
    # Psalm 119 has the highest number of verses in the Bible: 176
    if verse_end.present? && verse_end.to_i > 176
      errors.add(:verse_end, "can only be 176 or lower")
    end
  end

  def citation_format
    if verse_start.present?

      if verse_end.present? # Proverbs 3:5-6
        "#{book} #{chapter}:#{verse_start}-#{verse_end}"
      else # John 3:16
        "#{book} #{chapter}:#{verse_start}"
      end

    else # Psalm 23
      "#{book} #{chapter}"
    end
  end

  default_scope { order(:book, :chapter, :verse_start, :verse_end) }
  # I don't know why, but this doesn't show the VerseReferences in the right order.

  def self.within_book(book_title)
    where("book = ?", book_title)
  end
end
