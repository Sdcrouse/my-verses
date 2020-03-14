class VerseReferencesController < ApplicationController
  def index
    user_must_be_logged_in
    @verse_references = VerseReference.all
  end
end
