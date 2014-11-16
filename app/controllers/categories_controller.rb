class CategoriesController < ApplicationController

  def index
    @categories = Category.with_posters
    respond_to do |format|
      format.json{ render json: @categories , :only => [:name] }
    end
  end

end
