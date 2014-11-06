class Seed
  attr_reader :users_count, :groups_count, :trips_count

  def initialize(users_count = 100, trips_count = 50)
    @users_count = users_count
    @trips_count = trips_count
    generate_users
    generate_trips
  end

  def generate_users
    users_count.times do |i|
      user = User.create(first_name: Faker::Name.first_name,
                         last_name: Faker::Name.last_name,
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
                         location: "Breckenridge"
                         )
    end
    puts "#{trips_count} Trips created"
  end
end

Seed.new
