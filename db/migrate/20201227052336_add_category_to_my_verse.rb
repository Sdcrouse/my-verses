class AddCategoryToMyVerse < ActiveRecord::Migration[5.2]
  def change
    add_column :my_verses, :category, :string
  end
end
