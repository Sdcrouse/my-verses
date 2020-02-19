class VerseReference < ApplicationRecord
  validates :book, presence: true
  validates :chapter, presence: true
end
