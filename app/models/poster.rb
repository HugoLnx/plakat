class Poster < ActiveRecord::Base
  has_and_belongs_to_many:categories 
  belongs_to:user
  
  def self.filter(term: nil, categories: [])
    query = self
    if term
      query = QueryUtils.where_attr_like(query, :description, term)
    end
    query
  end
end
