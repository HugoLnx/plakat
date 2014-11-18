class PostersController < ApplicationController

  def index
    @posters = Poster.page(params[:page])
      .per(params[:per_page])
      .filter(term: params[:term], category: params[:category])
      .where("date_expiration >= ? AND posters.disabled = ? ", Time.now, false )
    respond_to do |format|
      format.json{ render json: @posters , :only => [:title , :description, :date_event, :ref_imagem] }
    end
  end

  def create
    poster = Poster.new poster_params
    poster.date_expiration = Time.now + 30.days
    poster.disabled = false
    respond_to do |format|
      if poster.save
        #PosterCreationNotifier.notify(email: params[:email], poster: poster).deliver!
        format.json{ head :ok }
        format.html{redirect_to "/"}
      else
        @errors = poster.errors
        format.json{ render "errors" }
      end
    end
  end

  def show
    @poster = Poster.find(params[:id])
    respond_to do |format|
      format.json{ render json: @poster , :only => [
        :title, 
        :description, 
        :date_event, 
        :ref_imagem, 
        :theme, 
        :visibility_title,
        :visibility_description,
        :visibility_date_event,
        :date_expiration,
        :disabled
         ] }
    end
  end

  def new
    @poster = Poster.new
    render :new, layout: false
  end

private
  def poster_params
    params.require(:poster).permit(:title, :description, :date_event,
      :date_expiration, :visibility_title, :visibility_description,
      :visibility_date_event, :theme, :ref_imagem)
  end
end
