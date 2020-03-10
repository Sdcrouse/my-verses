module VerseReferencesHelper
  def display_reference(ref)
    # Example return values:
      # Psalm 23
      # John 3:16
      # Proverbs 3:5-6

    reference_notation = "#{ref.book} #{ref.chapter}"

    if ref.verse_start # Not (yet) sure why I don't have to call #present? here.
      reference_notation += ":#{ref.verse_start}"

      if ref.verse_end.present?
        reference_notation += "-#{ref.verse_end}"
      end
    end

    reference_notation
  end
end
