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

  def create
    @my_verse = MyVerse.new(my_verse_params)
    @my_verse.verse_reference = VerseReference.find_or_initialize_by(verse_reference_params)
    # The line above probably needs to be refactored into a MyVerse method, but I don't yet know how.
    
    check_myverse_user_id and return

    if @my_verse.save
      flash[:success] = "Success! Here is your new MyVerse, #{current_user.username}:"
      redirect_to my_verse_path(@my_verse)
    else
      # Note: Since the form creates a MyVerse AND a VerseReference, some of the error messages look a bit weird.
      # I can try to change those messages later as a stretch goal.
      render :new
    end
  end

  def edit
    @my_verse = MyVerse.find(params[:id])
    @verse_reference = @my_verse.verse_reference
  end

  def update
    binding.pry
  end

  private
    def my_verse_params
      params.require(:my_verse).permit(
        :user_id, :version, :verse_text, :reason_liked
      )
    end

    def verse_reference_params
      params[:my_verse].require(:verse_reference).permit(
        :book, :chapter, :verse_start, :verse_end
      )
    end

    def check_myverse_user_id
      if @my_verse.user_id != current_user.id
        flash.now[:error] = "Impressive hacking, but you're not allowed to write a MyVerse for someone else."
        render :new
      end
    end
end
