require 'rails_helper'

RSpec.describe MyVerse, type: :model do
  # Valid MyVerses:
  let(:valid_myverse1) do
    {
      version: "NIV",
      verse_text: "In the beginning God created the heavens and the earth.",
      reason_liked: "This is the verse that starts it all!",
      verse_reference_id: 1,
      user_id: 1
    }
  end
  # End of valid MyVerses

  it "has a version, verse_text, reason_liked, verse_reference_id, and user_id, and is valid" do
    my_verse = MyVerse.new(valid_myverse1)

    expect(my_verse.version).to eq("NIV")
    expect(my_verse.verse_text).to eq("In the beginning God created the heavens and the earth.")
    expect(my_verse.reason_liked).to eq("This is the verse that starts it all!")
    expect(my_verse.verse_reference_id).to eq(1)
    expect(my_verse.user_id).to eq(1)

    expect(my_verse).to be_valid
  end

end
