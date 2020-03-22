class MyVerse < ApplicationRecord
  belongs_to :user
  belongs_to :verse_reference
  accepts_nested_attributes_for :verse_reference

  default_scope { order_by_verse_reference_and_version }

  validates :version, presence: true
  validates :verse_text, presence: true

  def user_name
    self.user.username
  end

  def belongs_to_user?(user)
    self.user == user
  end

  def self.any_with_book?(book_title)
    self.all.collect do |myverse|
      myverse.verse_reference
    end.detect{|ref| ref.book == book_title}
  end

  def reference_citation
    self.verse_reference.citation_format
  end

  def self.order_by_verse_reference_and_version
    joins(:verse_reference).merge(
      VerseReference.order_by_book_chapter_verse
    ).order(:version)
  end

  def self.order_by_username
    joins(:user).merge( User.order(:username) )
  end

  def self.in_book(book_title)
    joins(:verse_reference).merge( VerseReference.within_book(book_title) )
  end
end
