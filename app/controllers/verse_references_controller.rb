class VerseReferencesController < ApplicationController
  def index
    @verse_references = VerseReference.all
  end
end
