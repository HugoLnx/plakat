module QueryUtils
  extend self

  def postgresql?
    adapter = ActiveRecord::Base.connection.adapter_name.downcase.to_sym
    adapter == :postgresql
  end

  def where_attr_like(query, attr, term)
    if postgresql?
      query.where("#{attr} ilike ?", "%#{term}%")
    else
      query.where("#{attr} like ?", "%#{term}%")
    end
  end
end
