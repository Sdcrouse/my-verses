class MyVersesController < ApplicationController
  before_action :user_must_be_logged_in

  def index
    @my_verses = MyVerse.all
  end

  def show
    @my_verse = MyVerse.find(params[:id])
  end

  def edit
    @my_verse = MyVerse.find(params[:id])
    @verse_reference = @my_verse.verse_reference
  end
end
