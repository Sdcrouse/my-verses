class MyVersesController < ApplicationController
  before_action :user_must_be_logged_in

  def index
    if params[:verse_reference_id]
      @verse_reference = VerseReference.find_by(id: params[:verse_reference_id])
      redirect_if_nonexistent("Verse Reference", @verse_reference, verse_references_path) and return
      
      @my_verses = @verse_reference.my_verses
    else
      @my_verses = MyVerse.all
    end
  end

  def show
    @my_verse = MyVerse.find_by(id: params[:id])
    redirect_if_nonexistent("MyVerse", @my_verse, my_verses_path) and return
  end

  def new
    # Somehow, this still renders /verse_references/:verse_reference_id/my_verses/new, even if the User already has a MyVerse with that reference.
    # I need to use and probably refactor #redirect_if_user_already_has_this_myverse.
    @my_verse = MyVerse.new
    if params[:verse_reference_id]
      @my_verse.verse_reference = VerseReference.find_by(id: params[:verse_reference_id])
      redirect_if_nonexistent("Verse Reference", @my_verse.verse_reference, verse_references_path) and return
    else
      @my_verse.build_verse_reference
    end
  end

  def create
    @my_verse = MyVerse.new(my_verse_params)
    set_verse_reference_and_user_id
    redirect_if_user_already_has_this_myverse and return

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
    @my_verse = MyVerse.find_by(id: params[:id])
    redirect_if_nonexistent("MyVerse", @my_verse, my_verses_path) and return
    redirect_unless_authorized_to_edit and return

    @verse_reference = @my_verse.verse_reference
  end

  def update
    @my_verse = MyVerse.find_by(id: params[:id])
    redirect_if_nonexistent("MyVerse", @my_verse, my_verses_path) and return # Not sure if this works.
    redirect_unless_authorized_to_edit and return
    set_verse_reference_and_user_id

    # As of yet, I don't know how to prevent users from creating a duplicate MyVerse while editing a different one (an edge case).
    # I tried altering #redirect_if_user_already_has_this_myverse, but then it prevented users from updating a MyVerse unless they changed the VerseReference.
    
    if @my_verse.update(my_verse_params)
      flash[:success] = "Your MyVerse was successfully updated!"
      redirect_to my_verse_path(@my_verse)
    else
      render :edit
    end
  end

  def destroy
    my_verse = MyVerse.find_by(id: params[:id])
    redirect_if_nonexistent("MyVerse", @my_verse, my_verses_path) and return

    if my_verse.belongs_to_user?(current_user)
      my_verse.destroy
      flash[:success] = "MyVerse deleted."
    else
      flash[:error] = "You are not authorized to delete this MyVerse!"
    end

    redirect_to my_verses_path
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

    def set_verse_reference_and_user_id
      @my_verse.verse_reference = VerseReference.find_or_initialize_by(verse_reference_params)
      # The line above probably needs to be refactored into a MyVerse method, but I don't yet know how.
      
      @my_verse.user_id = current_user.id # This also prevents users from creating MyVerses for other people.
    end

    def redirect_if_user_already_has_this_myverse
      # I want to redirect users to the my_verse edit page if they already have a MyVerse with a given VerseReference.

      if mv = current_user.find_myverse_with_reference(@my_verse.verse_reference)
        flash[:error] = "You already have a MyVerse with this Verse Reference! Feel free to edit it here."
        redirect_to edit_my_verse_path(mv)
      end
    end

    def redirect_if_nonexistent(obj_type, obj, path_of_redirection)
      if obj.nil?
        flash[:error] = "This #{obj_type} does not exist."
        redirect_to path_of_redirection
      end
    end

    def redirect_unless_authorized_to_edit
      if @my_verse.user != current_user
        flash[:error] = "You are not authorized to edit this MyVerse."
        redirect_to my_verses_path
      end
    end
end
