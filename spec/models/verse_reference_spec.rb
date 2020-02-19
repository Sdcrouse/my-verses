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

  it "has a book, chapter, verse_start, and verse_end" do
    valid_verse = VerseReference.new(valid_verse_reference_attributes)

    expect(valid_verse.book).to eq("Proverbs")
    expect(valid_verse.chapter).to eq("3")
    expect(valid_verse.verse_start).to eq("5")
    expect(valid_verse.verse_end).to eq("6")
  end

  it "is valid with a book, chapter, verse_start, and verse_end" do
    expect(VerseReference.new(valid_verse_reference_attributes)).to be_valid
  end

  it "can be saved with valid attributes" do
    valid = VerseReference.create(valid_verse_reference_attributes)
    expect(valid.id).to_not be_nil
  end

  it "is valid without a verse_start or verse_end" do
    expect(VerseReference.new(only_book_and_chapter)).to be_valid
  end

  it "can be saved without a verse_start or verse_end" do
    missing_optional_attributes = VerseReference.create(only_book_and_chapter)
    expect(missing_optional_attributes.id).to_not be_nil
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
