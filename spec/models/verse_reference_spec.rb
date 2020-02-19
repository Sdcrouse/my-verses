require 'rails_helper'

RSpec.describe VerseReference, type: :model do
  let(:valid_verse_reference_attributes) do
    {
      book: "Proverbs",
      chapter: "3",
      verse_start: "5",
      verse_end: "6"
    }
  end

  let(:only_book_and_chapter) do
    valid_verse_reference_attributes.except(:verse_start, :verse_end)
  end

  it "is valid with a book, chapter, verse_start, and verse_end" do
    expect(VerseReference.new(valid_verse_reference_attributes)).to be_valid
  end

  it "is valid without a verse_start or verse_end" do
    expect(VerseReference.new(only_book_and_chapter)).to be_valid
  end

  it "is invalid without a book and chapter" do
    invalid_verse_reference = VerseReference.new

    expect(invalid_verse_reference).to_not be_valid
    expect(invalid_verse_reference.errors.full_messages).to include(
      "Book can't be blank",
      "Chapter can't be blank"
    )
  end

end
