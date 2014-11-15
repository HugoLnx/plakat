class Category < ActiveRecord::Base
  has_and_belongs_to_many:posters 
  belongs_to:user
  
end