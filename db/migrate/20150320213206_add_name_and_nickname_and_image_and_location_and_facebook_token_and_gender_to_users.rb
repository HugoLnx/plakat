class AddNameAndNicknameAndImageAndLocationAndFacebookTokenAndGenderToUsers < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :image, :string
    add_column :users, :location, :string
    add_column :users, :facebook_token, :string
    add_column :users, :gender, :string
    change_column :users, :id_facebook, :string
  end

  def down
    remove_column :users, :name
    remove_column :users, :nickname
    remove_column :users, :image
    remove_column :users, :location
    remove_column :users, :facebook_token
    remove_column :users, :gender
    change_column :users, :id_facebook, :integer
  end
end
