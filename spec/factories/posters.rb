FactoryGirl.define do
  factory :poster do
   title "Novo post"
   description "Descricao do post"
   date_event Time.now
   ref_imagem "alexandre.jpg"
   date_expiration Time.now + 15
   disabled false
   cause_blockage nil
   theme "neve"
   visibility_title true
   visibility_description true
   visibility_date_event true
  end

end
