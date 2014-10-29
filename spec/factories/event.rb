FactoryGirl.define do
  factory :event, class: Event do
    name "Shred Breck, brah"
    description "It'll be the best shredding ever!"
    start_time Time.now.to_date
    end_time Time.now.to_date + 1
    location "Breckenridge, CO"
  end
end
