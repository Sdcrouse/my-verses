class MyVerse < ApplicationRecord

  validates :version, presence: true
  validates :verse_text, presence: true
end
