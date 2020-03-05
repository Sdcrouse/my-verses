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
      "Verse_text can't be blank"
    )
  end

end
