require 'rails_helper'

RSpec.describe PostersController, :type => :controller do
  describe "GET index" do
    context " term:'', categories: [], page: 1, per_page: 2 " do
      it "return first 2 posters of any category" do
        posters = FactoryGirl.create_list :poster , 3
        get :index , term: '', categories: [], page: 1, per_page: 2, format: 'json'
        expect(assigns(:posters)).to be == posters.first(2)
      end
    end
  end
end
