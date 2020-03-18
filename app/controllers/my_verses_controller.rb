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
    @my_verse.user_id = current_user.id # This also prevents users from creating MyVerses for other people.

    redirect_if_myverse_exists and return

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

    redirect_unless_authorized_to_edit and return

    @verse_reference = @my_verse.verse_reference
  end

  def update
    @my_verse = MyVerse.find(params[:id])
    redirect_unless_authorized_to_edit and return
    @my_verse.verse_reference = VerseReference.find_or_initialize_by(verse_reference_params)
    @my_verse.user_id = current_user.id # This also prevents users from creating MyVerses for other people.

    redirect_if_myverse_exists and return 
    # I don't like that this redirects to another edit page instead of re-rendering the same one.
    
    if @my_verse.update(my_verse_params)
      flash[:success] = "Your MyVerse was successfully updated!"
      redirect_to my_verse_path(@my_verse)
    end
  end

  private
    def my_verse_params
      params.require(:my_verse).permit(
        :version, :verse_text, :reason_liked
      )
    end

    def verse_reference_params
      params[:my_verse].require(:verse_reference).permit(
        :book, :chapter, :verse_start, :verse_end
      )
    end

    def redirect_if_myverse_exists
      # I want to redirect users to the my_verse edit page if they already have a MyVerse with a given VerseReference.
      
      if mv = MyVerse.find_by(user_id: current_user.id, verse_reference: @my_verse.verse_reference)
        flash[:error] = "You already have a MyVerse with this Verse Reference! Feel free to edit it here."
        redirect_to edit_my_verse_path(mv)
      end
    end

    def redirect_unless_authorized_to_edit
      if @my_verse.user != current_user
        flash[:error] = "You are not authorized to edit this MyVerse."
        redirect_to my_verses_path
      end
    end
end
