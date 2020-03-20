module MyVersesHelper
  def link_to_my_verse(mv)
    link_to "#{mv.reference_citation} (#{mv.version})", my_verse_path(mv)
  end
end
