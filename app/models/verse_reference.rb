class VerseReference < ApplicationRecord
  validates :book, presence: true
  validates :chapter, presence: true

  def book=(book)
    # Instead of validating for a titleized book, 
    # I will convert it to one here.
    # However, the uniqueness validation should be called AFTER this method is run.
    
    # write_attribute(:book, book.downcase.titleize) # This works.
    super(book.downcase.titleize) # But this is the Rails way to do it.
  end
end
