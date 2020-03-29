module VerseReferencesHelper
  def button_to_new_myverse_with_reference(ref)
    if !current_user.has_verse_reference?(ref)
      button_to("Create a MyVerse with this Verse Reference", 
        new_verse_reference_my_verse_path(ref), method: :get
      )
    end
  end
end
