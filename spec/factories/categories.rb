FactoryGirl.define do
  factory :category do
    name{|i| "Category #{i}"}
    disabled false
  end
end
