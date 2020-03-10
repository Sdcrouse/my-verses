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
    @verse_reference = VerseReference.new(verse_reference_params)
    myverse = @verse_reference.my_verses.last
    @verse_reference.save
    redirect_to my_verse_path(myverse)
    # binding.pry
    # Note: The hidden_field can be hacked, so make sure that the user_id is the same as current_user.id.
  end

  private
    def verse_reference_params
      params.require(:verse_reference).permit(
        :book, :chapter, :verse_start, :verse_end, 
        my_verses_attributes: [:user_id, :version, :verse_text, :reason_liked]
      )
    end
end
