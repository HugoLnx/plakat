class HomeController < ApplicationController
  def index
  	@posters = Poster.all
  end
end