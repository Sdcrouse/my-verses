require 'rails_helper'

RSpec.describe MyVerse, type: :model do
  let(:valid_myverse) do
    {
      version: "NIV",
      verse_text: "In the beginning God created the heavens and the earth.",
      reason_liked: "This is the verse that starts it all!",
      verse_reference_id: 1,
      user_id: 1
    }
  end

  let(:no_user_or_reference_ids) { valid_myverse.except(:verse_reference_id, :user_id) }

  it "has a version, verse_text, reason_liked, verse_reference_id, and user_id, and is valid" do
    my_verse = MyVerse.new(valid_myverse)

    expect(my_verse.version).to eq("NIV")
    expect(my_verse.verse_text).to eq("In the beginning God created the heavens and the earth.")
    expect(my_verse.reason_liked).to eq("This is the verse that starts it all!")
    expect(my_verse.verse_reference_id).to eq(1)
    expect(my_verse.user_id).to eq(1)

    expect(my_verse).to be_valid
  end

  it "is valid without a reason_liked" do
    missing_reason_liked = valid_myverse.except(:reason_liked)

    expect(MyVerse.new(missing_reason_liked)).to be_valid
  end

  it "is invalid without a version and/or verse_text" do
    missing_version_and_text = valid_myverse.except(:version, :verse_text)
    invalid_myverse = MyVerse.new(missing_version_and_text)

    expect(invalid_myverse).to_not be_valid
    expect(invalid_myverse.errors.full_messages).to include(
      "Version can't be blank",
      "Verse text can't be blank"
    )
  end

  it "belongs to a User and a VerseReference" do
    moses = User.create(username: "moses", email: "lawgiver@israel.com", password: "tencommandments")
    ref = VerseReference.create(book: "Genesis", chapter: "1", verse_start: "1")

    myverse_with_user_and_reference = no_user_or_reference_ids.merge(user: moses, verse_reference: ref)
    moses_myverse = MyVerse.create(myverse_with_user_and_reference)

    expect(moses_myverse).to be_valid
    expect(moses_myverse.user).to eq(moses)
    expect(moses_myverse.verse_reference).to eq(ref)
  end
  
end
