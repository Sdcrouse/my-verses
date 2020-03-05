class CreateMyVerses < ActiveRecord::Migration[5.2]
  def change
    create_table :my_verses do |t|
      t.string :version
      t.text :verse_text
      t.text :reason_liked
      t.integer :user_id
      t.integer :verse_reference_id

      t.timestamps
    end
  end
end
