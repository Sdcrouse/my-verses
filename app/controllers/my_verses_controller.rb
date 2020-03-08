class MyVersesController < ApplicationController
  def index
    user_must_be_logged_in
    @my_verses = MyVerse.all
  end

  def show
    user_must_be_logged_in
    @my_verse = MyVerse.find(params[:id])
  end
end
