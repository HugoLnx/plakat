class Category < ActiveRecord::Base
  has_and_belongs_to_many:posters 
  belongs_to:user
  
  def self.with_posters
  	return distinct(:categories).joins(:posters)
  end

end