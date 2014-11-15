require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
  describe "GET index" do
    context "all categories with posters associated", focus: true do
      it "return 3 categories" do
        posters    = create_list :poster, 4
        categories_with_posters = create_list :category , 3, posters:posters
        qcategories_without_posters = create_list :category , 1
        get :index, format: 'json'
        expect(assigns(:categories).sort).to be == categories_with_posters.sort
      end
    end
  end
end