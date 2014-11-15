class PostersController < ApplicationController

	def index
		@posters = Poster.page(params[:page]).per(params[:per_page])
		respond_to do |format|
		  format.json{ render json: @posters , :only => [:title , :description, :date_event] }
		end
	end

end
