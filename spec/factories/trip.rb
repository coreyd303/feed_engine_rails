FactoryGirl.define do
  factory :trip, class: Trip do
    name "Shred Breck, brah"
    description "It'll be the best shredding ever!"
    date Time.now.to_date
    trip_location "Breckenridge, CO"
  end
end
