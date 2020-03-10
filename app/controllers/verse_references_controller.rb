require 'pry'

class VerseReferencesController < ApplicationController
  before_action :user_must_be_logged_in

  def index
    @verse_references = VerseReference.all
  end

  def new
    @verse_reference = VerseReference.new
    @verse_reference.my_verses.build
  end

  def create
    binding.pry
    # Note: The hidden_field can be hacked, so make sure that the user_id is the same as current_user.id.
  end
end
