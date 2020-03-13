class MyVersesController < ApplicationController
  before_action :user_must_be_logged_in

  def index
    @my_verses = MyVerse.all
  end

  def show
    @my_verse = MyVerse.find(params[:id])
  end

  def new
    @my_verse = MyVerse.new
    @my_verse.build_verse_reference
  end

  def edit
    @my_verse = MyVerse.find(params[:id])
    @verse_reference = @my_verse.verse_reference
  end
end
