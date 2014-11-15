module QueryUtils
  extend self

  def postgresql?
    adapter = ActiveRecord::Base.connection.adapter_name.downcase.to_sym
    adapter == :postgresql
  end

  def concatenate_attrs(*attrs)
    if QueryUtils.postgresql?
      attrs.map!{|attr| "COALESCE(#{attr}, '')"}
      concat = "(#{attrs.join(" || ")})"
    else
      attrs.map!{|attr| "IFNULL(#{attr}, '')"}
      concat = "CONCAT(#{attrs.join(",")})"
    end
    concat
  end

  def where_attr_like(query, attr, term)
    if postgresql?
      query.where("#{attr} ilike ?", "%#{term}%")
    else
      query.where("#{attr} like ?", "%#{term}%")
    end
  end
end
