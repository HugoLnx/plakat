class CreateLog < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :type
      t.text :description
      t.date :date_save

      t.timestamps
    end
  end
end
