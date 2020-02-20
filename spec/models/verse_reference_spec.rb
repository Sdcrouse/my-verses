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

  it "can be saved with valid attributes" do
    valid = VerseReference.create(valid_verse_reference_attributes)
    expect(valid.id).to_not be_nil
  end

  it "can be saved without a verse_start or verse_end" do
    missing_optional_attributes = VerseReference.create(only_book_and_chapter)
    expect(missing_optional_attributes.id).to_not be_nil
  end

  it "is invalid without a book and chapter and can't be saved" do
    invalid_verse_reference = VerseReference.create

    expect(invalid_verse_reference.id).to be_nil
    expect(invalid_verse_reference.errors.full_messages).to include(
      "Book can't be blank",
      "Chapter can't be blank"
    )
  end

  it "titleizes its book, no matter what the user input is" do
    book_titles = ["1 kings", "song of Songs", "gaLatiaNs"]
    titleized_book_titles = ["1 Kings", "Song Of Songs", "Galatians"]

    book_titles.each_with_index do |book_title, index|
      reference = VerseReference.new(valid_verse_reference_attributes.merge(book: book_title))
      expect(reference.book).to eq(titleized_book_titles[index])
    end
  end

  it "is invalid if the chapter is not a string between '1' and '150'" do
    invalid_chapters = ["-5", "151", "Lorem ipsum"]

    invalid_chapters.each do |chap|
      bad_reference = VerseReference.new(valid_verse_reference_attributes.merge(chapter: chap))
      expect(bad_reference).to_not be_valid
    end
  end

  it "is invalid if the verse_start (when given) is not a string between '1' and '176'" do
    invalid_verse_starts = ["-1", "177", "Bad verse number"]

    invalid_verse_starts.each do |verse|
      bad_reference = VerseReference.new(valid_verse_reference_attributes.merge(verse_start: verse))
      expect(bad_reference).to_not be_valid
    end
  end

  it "is invalid if the verse_start is blank, but the verse_end is not" do
    bad_reference = VerseReference.new(valid_verse_reference_attributes.except(:verse_start))
    expect(bad_reference).to_not be_valid
  end

  it "is invalid if the verse_end (when given) is not a number, is <= verse_start, or is > '176'" do
    invalid_verse_ends = ["Lorem Ipsum", "4", "5", "177"]

    invalid_verse_ends.each do |verse|
      bad_reference = VerseReference.new(valid_verse_reference_attributes.merge(verse_end: verse))
      expect(bad_reference).to_not be_valid
    end
  end
end
