class VerseReferencesController < ApplicationController
  before_action :user_must_be_logged_in

  def index
    @verse_references = VerseReference.all
  end

  def new
    @verse_reference = VerseReference.new
  end
end
