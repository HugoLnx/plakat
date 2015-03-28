class PostersController < ApplicationController

  def index
    @posters = Poster.filter(term: params[:term], category: params[:category])
      .page(params[:page])
      .per(params[:per_page])
      .where("date_expiration >= ? AND posters.disabled = ? ", Time.now, false )
      .order(created_at: :desc)
    respond_to do |format|
      format.json{ render json: @posters ,
        :only => [:id, :title , :description, :date_event, :ref_imagem],
        :include => {
          :categories => {only: :name}
        }
      }
    end
  end

  def create
    poster = Poster.new poster_params
    poster.date_expiration = Time.now + 30.days
    poster.disabled = false
    respond_to do |format|
      if poster.save!
        #PosterCreationNotifier.notify(email: params[:email], poster: poster).deliver!
        format.json{ head :ok }
        format.html{redirect_to "/plaks/#{poster.id}"}
      else
        @errors = poster.errors
        format.json{ render "errors" }
      end
    end
  end

  def show
    @poster = Poster.includes(:categories).find(params[:id])
    @image_url = @poster.ref_imagem.large.url
    respond_to do |format|
      format.html
      format.json{ render json: @poster,
      :include => {
        :categories => {only: :name}
      },
      :only => [
        :title, 
        :description, 
        :date_event, 
        :ref_imagem, 
        :theme, 
        :visibility_title,
        :visibility_description,
        :visibility_date_event,
        :date_expiration,
        :disabled,
      ]}
    end
  end

  def new
    @poster     = Poster.new
    @categories = Category.all
  end

private
  def poster_params
    params.require(:poster).permit(:title, :description, :date_event,
      :date_expiration, :visibility_title, :visibility_description,
      :visibility_date_event, :theme, :ref_imagem)
  end
end
