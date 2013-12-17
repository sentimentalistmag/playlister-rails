require 'factory_girl'

FactoryGirl.define do
  factory :artist do
    name "DZA"
    record_label "Fools Gold"
  end

  factory :nick_drake do
    name "Nick Drake"
    record_label "Drakes"
  end

end