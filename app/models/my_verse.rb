class MyVerse < ApplicationRecord
  belongs_to :user
  belongs_to :verse_reference

  validates :version, presence: true
  validates :verse_text, presence: true
end
