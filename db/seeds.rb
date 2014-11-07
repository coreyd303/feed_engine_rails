class Seed
  attr_reader :users_count, :trips_count, :users_per_trip

  def initialize(users_count = 100, trips_count = 50, users_per_trip = 5)
    @users_count    = users_count
    @trips_count    = trips_count
    @users_per_trip = users_per_trip
    generate_users
    generate_trips
    add_users_to_trips
  end

  def generate_users
    users_count.times do |i|
      user = User.create(name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
                         email: Faker::Internet.email
                        )
    end
    puts "#{users_count} users created"
  end

  def generate_trips
    trips_count.times do |i|
      trip = Trip.create(name: Faker::Company.name,
                         description: Faker::Lorem.sentences.join,
                         date: Faker::Time.forward(rand(0..50), :morning),
                         trip_location: "Breckenridge"
                        )
    end
    puts "#{trips_count} Trips created"
  end

  def add_users_to_trips
    users = User.all.length
    Trip.all.each do |trip|
      users_per_trip.times do
        user = User.find(rand(1..users))
        trip.users << user
      end
    end
    puts "#{users_per_trip} users added to each trip"
  end
end

Seed.new
