class HomeController < ApplicationController
  def index
    @categories = Category.all
    @term = params[:term]
    @category = Category.find_by_name params[:category]
    @posters = Poster.filter(term: @term, category: @category)
      .page(params[:page])
      .per(params[:per_page])
      .order(created_at: :desc)
      #.where("date_expiration >= ? AND posters.disabled = ? ", Time.now, false )
  end
end
