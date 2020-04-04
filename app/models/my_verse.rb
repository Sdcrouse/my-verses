class MyVerse < ApplicationRecord
  # -------- Associations and validations ----------------
  belongs_to :user
  belongs_to :verse_reference
  accepts_nested_attributes_for :verse_reference

  validates :version, presence: true
  validates :verse_text, presence: true

  # --------- Scopes ---------------
  default_scope { order_by_reference_version_and_username }

  def self.order_by_reference_version_and_username
    # Due to the complexity of this scope, I am choosing not to use the #scope syntactic sugar here.
    # Ideally, the User profile would not order MyVerses by username,
    # but this at least simplifies the MyVersesController.

    joins(:verse_reference).merge(
      VerseReference.order_by_book_chapter_verse
    ).order(:version).joins(:user).merge( User.order(:username) )
  end

  def self.in_book(book_title) 
    # I am using a class method here because, according to the documentation at https://guides.rubyonrails.org/active_record_querying.html#passing-in-arguments,
    # "using a class method is the preferred way to accept arguments for scopes".
    joins(:verse_reference).merge( VerseReference.within_book(book_title) )
  end

  # ---------- Helper methods ---------------
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
