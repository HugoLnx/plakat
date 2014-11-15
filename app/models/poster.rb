class Poster < ActiveRecord::Base
  has_and_belongs_to_many:categories 
  belongs_to:user
  
  def self.filter(term: nil, category: nil)
    query = self
    if term
      query = QueryUtils.where_attr_like(query, :description, term)
    end
    if category
      query = query.joins(:categories).where(categories_posters: {category_id: category})
    end
    query
  end
end
