class PostersController < ApplicationController

  def index
    @posters = Poster.page(params[:page])
      .per(params[:per_page])
      .filter(term: params[:term], category: params[:category])
      .where("date_expiration >= ? AND posters.disabled = ? ", Time.now, false )
    respond_to do |format|
      format.json{ render json: @posters , :only => [:title , :description, :date_event] }
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

end
