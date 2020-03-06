class MyVersesController < ApplicationController
  def index
    @my_verses = MyVerse.all
  end
end
