class CreateCategoriesPosters < ActiveRecord::Migration
  def change
    create_table :categories_posters do |t|
      t.integer :category_id
      t.integer :poster_id

      t.timestamps
    end
    add_index :categories_posters, :category_id
    add_index :categories_posters, :poster_id
  end
end
