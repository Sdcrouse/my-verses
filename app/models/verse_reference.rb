class VerseReference < ApplicationRecord
  validates :book, presence: true
  validates :chapter, presence: true, inclusion: { within: "1".."150", 
    message: "%{value} is not a chapter in any book of the Bible. It must be a number between 1 and 150."}
    # The Bible does not have any chapter numbers lower than 1.
    # The Book of Psalms has the greatest number of chapters: 150.

  def book=(book)
    # Instead of validating for a titleized book, 
    # I will convert it to one here.
    # However, the uniqueness validation should be called AFTER this method is run.
    
    # write_attribute(:book, book.downcase.titleize) # This works.
    super(book.downcase.titleize) # But this is the Rails way to do it.
  end
end
