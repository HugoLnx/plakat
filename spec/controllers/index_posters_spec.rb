require 'rails_helper'

RSpec.describe PostersController, :type => :controller do
  describe "GET index" do
    context "term:'', categories: [], page: 1, per_page: 2" do
      it "return first 2 posters of any category" do
        posters = FactoryGirl.create_list :poster , 3
        get :index , term: '', categories: [], page: 1, per_page: 2, format: 'json'
        expect(assigns(:posters)).to be == posters.first(2)
      end
    end

    context "term:'end', categories: [], page: 1, per_page: 10" do
      it "return all posters that have 'end' in description" do
        posters_with_term = ["kend", "blended"].map{|desc| FactoryGirl.create :poster, description: desc}
        posters_without_term = ["enk", "blenked"].map{|desc| FactoryGirl.create :poster, description: desc}
        get :index , term: 'end', categories: [], page: 1, per_page: 10, format: 'json'
        expect(assigns(:posters)).to be == posters_with_term
      end
    end
  end
end
