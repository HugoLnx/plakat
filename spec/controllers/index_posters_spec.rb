require 'rails_helper'

RSpec.describe PostersController, :type => :controller do
  describe "GET show" do
    context "id: 1" do
      it "return poster with id = 1" do
        posters = FactoryGirl.create(:poster, :id => 1)
        get :show , id: 1, format: 'json'
        expect(assigns(:poster)).to be == posters
      end
    end
  end 

  describe "GET index" do
    context "term:'', category: nil, page: 1, per_page: 2" do
      it "return first 2 posters of any category" do
        posters = create_list :poster , 3
        get :index , term: '', categories: [], page: 1, per_page: 2, format: 'json'
        expect(assigns(:posters)).to be == posters.first(2)
      end
    end

    context "term:'end', category: nil, page: 1, per_page: 10" do
      it "return all posters that have 'end' in description" do
        posters_with_term = ["kend", "blended"].map{|desc| create :poster, description: desc}
        posters_without_term = ["enk", "blenked"].map{|desc| create :poster, description: desc}
        get :index , term: 'end', categories: [], page: 1, per_page: 10, format: 'json'
        expect(assigns(:posters)).to be == posters_with_term
      end

      it "return all posters that have 'end' in title" do
        posters_with_term = ["kend", "blended"].map{|title| create :poster, title: title}
        posters_without_term = ["enk", "blenked"].map{|title| create :poster, title: title}
        get :index , term: 'end', categories: [], page: 1, per_page: 10, format: 'json'
        expect(assigns(:posters)).to be == posters_with_term
      end
    end

    context "term:'', category: 1, page: 1, per_page: 10" do
      it "return all posters that have the category" do
        categories = create_list(:category, 3)
        selected = categories.first
        unselecteds = categories - [selected]

        posters_with_selected_categories = [
          create(:poster, categories: [selected]),
          create(:poster, categories: [selected, unselecteds.first]),
          create(:poster, categories: [unselecteds.last, selected])
        ]

        posters_without_selected_categories = [
          create(:poster, categories: unselecteds),
          create(:poster, categories: []),
          create(:poster, categories: [unselecteds.first])
        ]

        get :index, term: '', category: selected.id, page: 1, per_page: 10, format: 'json'
        expect(assigns(:posters)).to be == posters_with_selected_categories
      end
    end

    context "term:'end', category: 1, page: 1, per_page: 10" do
      it "return all posters that have the category and the term in description" do
        categories = create_list(:category, 3)
        selected = categories.first
        unselecteds = categories - [selected]

        selected_posters = [
          create(:poster, description: "end", categories: [selected]),
          create(:poster, description: "blended", categories: [selected, unselecteds.first]),
          create(:poster, description: "byend", categories: [unselecteds.last, selected])
        ]

        unselected_posters = [
          create(:poster, description: "end", categories: unselecteds),
          create(:poster, description: "abc", categories: [selected]),
          create(:poster, description: "def", categories: [unselecteds.first])
        ]

        get :index, term: 'end', category: selected.id, page: 1, per_page: 10, format: 'json'
        expect(assigns(:posters)).to be == selected_posters
      end
    end

    context "term:'', categories: [], page: 1, per_page: 2" do
      it "return 1 poster not expired" do
        poster_expired     = FactoryGirl.create(:poster, :date_expiration => Time.now - 5.day)
        poster_not_expired = FactoryGirl.create(:poster, :date_expiration => Time.now + 5.day)
        posters = [poster_not_expired] + [poster_expired]
        get :index , term: '', categories: [], page: 1, per_page: 2, format: 'json'
        expect(assigns(:posters)).to be == posters.first(1)
      end
    end


    context "term:'', categories: [], page: 1, per_page: 2" do
      it "return 1 poster that is not disabled" do
        poster_disabled         = FactoryGirl.create(:poster, :disabled => true)
        poster_not_disabled     = FactoryGirl.create(:poster, :disabled => false)
        posters = [poster_not_disabled] + [poster_disabled]
        get :index , term: '', categories: [], page: 1, per_page: 2, format: 'json'
        expect(assigns(:posters)).to be == posters.first(1)
      end
    end

  end
end
