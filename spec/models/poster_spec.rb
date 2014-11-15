require 'rails_helper'

RSpec.describe Poster, :type => :model do
  it "is salvable" do
  	poster = Poster.new title: "Novo post",
  			   description: "Descricao do post",
  			   date_event: Time.now,
  			   ref_imagem: "alexandre.jpg",
  			   date_expiration: Time.now + 15,
  			   disabled: false,
  			   cause_blockage: nil,
  			   theme: "neve",
  			   visibility_title: true,
  			   visibility_description: true,
  			   visibility_date_event: true
  	expect(poster.save).to be == true 
  end
end
