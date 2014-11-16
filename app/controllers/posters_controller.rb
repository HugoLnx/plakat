class PostersController < ApplicationController

  def index
    @posters = Poster.page(params[:page])
      .per(params[:per_page])
      .filter(term: params[:term], category: params[:category])
    respond_to do |format|
      format.json{ render json: @posters , :only => [:title , :description, :date_event] }
    end
  end

  def create
    poster = Poster.new poster_params
    respond_to do |format|
      if poster.save
        PosterCreationNotifier.notify(email: params[:email], poster: poster).deliver!
        format.json{ head :ok }
      else
        @errors = poster.errors
        format.json{ render "errors" }
      end
    end
  end

private
  def poster_params
    params.require(:poster).permit(:title, :description, :date_event,
      :date_expiration, :visibility_title, :visibility_description,
      :visibility_date_event, :theme, :ref_imagem)
  end
end
