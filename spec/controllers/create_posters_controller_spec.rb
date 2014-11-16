require 'rails_helper'

RSpec.describe PostersController do
  describe "POST create" do
    let(:title){ "My Plakat Title" }
    let(:description){ "My cool Plakat Description" }
    let(:date_event){ Time.now.to_date }
    let(:date_expiration){ (Time.now + 15).to_date }
    let(:visibility_title){ true }
    let(:visibility_description){ true }
    let(:visibility_date_event){ true }
    let(:theme){ "snow" }
    let(:image){ fixture_file_upload("images/poster.jpg", "image/jpeg") }

    before :each do
      post :create, 
        email: "fulano@mail.com",
        poster: {
          title: title,
          description: description,
          date_event: date_event,
          date_expiration: date_expiration,
          visibility_title: visibility_title,
          visibility_description: visibility_description,
          visibility_date_event: visibility_date_event,
          theme: theme,
          ref_imagem: image
        },
        format: :json

    end

    it "sends email notifying criaTIvo staff" do
      email_delivered = ActionMailer::Base.deliveries[0]
      expect(email_delivered).to_not be_nil
      expect(email_delivered.from).to include "plakat.contato@gmail.com"
      expect(email_delivered.to).to include "criativo-puc@googlegroups.com"
    end

    it "saves the poster in database" do
      poster = Poster.first
      expect(poster).to_not be_nil
      expect(poster.title).to be == title
      expect(poster.description).to be == description
      expect(poster.date_event).to be == date_event
      expect(poster.date_expiration).to be == date_expiration
      expect(poster.visibility_title).to be == visibility_title
      expect(poster.visibility_description).to be == visibility_description
      expect(poster.visibility_date_event).to be == visibility_date_event
      expect(poster.theme).to be == theme
      expect(poster.ref_imagem).to_not be_nil
    end

    it "return a json of errors when poster are invalid"
  end
end
