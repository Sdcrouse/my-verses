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

  def reference_citation
    self.verse_reference.citation_format
  end

  def self.order_by_verse_reference_and_version
    joins(:verse_reference).merge(
      VerseReference.order_by_book_chapter_verse
    ).order(:version)
  end

  scope :order_by_username, -> { joins(:user).merge(User.order(:username)) }

  def self.in_book(book_title) 
    # I am using a class method here because, according to the documentation at https://guides.rubyonrails.org/active_record_querying.html#passing-in-arguments,
    # "using a class method is the preferred way to accept arguments for scopes".
    joins(:verse_reference).merge( VerseReference.within_book(book_title) )
  end
end
