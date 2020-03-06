class MyVersesController < ApplicationController
  def index
    user_must_be_logged_in
    @my_verses = MyVerse.all
  end
end
