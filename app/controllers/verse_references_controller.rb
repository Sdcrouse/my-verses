class VerseReferencesController < ApplicationController
  def index
    if logged_in?
      @verse_references = VerseReference.all
    else
      authorization_error_and_redirect
    end
  end
end
