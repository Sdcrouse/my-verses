module VerseReferencesHelper
  def link_to_new_myverse_with_reference(ref)
    if !current_user.has_verse_reference?(ref)
      link_to "Create a MyVerse with this Verse Reference", new_verse_reference_my_verse_path(ref)
    end
  end
end
