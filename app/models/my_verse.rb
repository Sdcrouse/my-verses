class MyVerse < ApplicationRecord
  belongs_to :user
  belongs_to :verse_reference
  accepts_nested_attributes_for :verse_reference

  validates :version, presence: true
  validates :verse_text, presence: true

  def user_name
    self.user.username
  end
end
