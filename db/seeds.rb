class Seed
  attr_reader :users_count, :groups_count, :trips_count

  def initialize(users_count = 100, groups_count = 10, trips_count = 50)
    @users_count = users_count
    @groups_count = groups_count
    @trips_count = trips_count
    generate_users
    generate_groups
    generate_trips
    add_users_to_groups
    add_trips_to_groups
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

  def generate_groups
    groups_count.times do |i|
      group = Group.create(name: Faker::Company.name,
                           description: Faker::Lorem.sentences.join
                           )
      end
    puts "#{groups_count} Groups created"
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

  def add_users_to_groups
    users = User.all
    users << User.first(20)
    users.each do |user|
      group = Group.find(rand(1..Group.count))
      group.users << user
    end 
  end

  def add_trips_to_groups
    trips = Trip.all
    trips.each do |trip|
      group = Group.find(rand(1..Group.count))
      group.trips << trip
    end
  end
end

Seed.new
