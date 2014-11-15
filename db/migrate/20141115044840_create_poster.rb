class CreatePoster < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.string :title 
      t.text :description
      t.date :date_event
      t.string :ref_imagem
      t.date :date_expiration
      t.boolean :disabled
      t.text :cause_blockage
      t.string :theme
      t.boolean :visibility_title
      t.boolean :visibility_description
      t.boolean :visibility_date_event

      t.timestamps
    end
  end
end
