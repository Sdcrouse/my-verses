class MyVerse < ApplicationRecord
  belongs_to :user
  belongs_to :verse_reference
  accepts_nested_attributes_for :verse_reference

  validates :version, presence: true
  validates :verse_text, presence: true

  def user_name
    self.user.username
  end

  def belongs_to_user?(user)
    self.user == user
  end

  def reference_citation
    self.verse_reference.citation_format
  end
end
