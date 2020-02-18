class CreateVerseReferences < ActiveRecord::Migration[5.2]
  def change
    create_table :verse_references do |t|
      t.string :book
      t.string :chapter
      t.string :verse_start
      t.string :verse_end

      t.timestamps
    end
  end
end
