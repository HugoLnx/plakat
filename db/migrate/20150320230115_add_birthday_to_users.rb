class AddBirthdayToUsers < ActiveRecord::Migration
  def up
    add_column :users, :birthday, :date
    remove_column :users, :perfil
    remove_column :users, :nickname
  end
  def down
    remove_column :users, :birthday
    add_column :users, :perfil, :string
    add_column :users, :nickname, :string
  end
end
