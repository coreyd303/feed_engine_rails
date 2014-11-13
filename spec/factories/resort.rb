FactoryGirl.define do
  factory :resort, class: Resort do
    id 1
    name Faker::Name.name 
  end
end
