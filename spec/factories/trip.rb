FactoryGirl.define do
  factory :trip, class: Trip do
    name Faker::Lorem.sentence(3)
    description Faker::Lorem.paragraph
    date Faker::Date.forward(30)
    resort_id 1
  end
end
