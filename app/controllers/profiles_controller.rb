class ProfilesController < ApplicationController
  before_filter :check_login

  def show
    respond_to do |format|
      format.json { render json: current_user }
    end
  end

private
  def check_login
    unless logged_in?
      render text: "not-logged-in", status: :not_authorized
    end
  end
end
