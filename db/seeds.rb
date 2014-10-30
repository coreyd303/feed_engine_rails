class Seed
  attr_reader :users_count, :groups_count, :events_count

  def initialize(users_count = 100, groups_count = 10, events_count = 50)
    @users_count = users_count
    @groups_count = groups_count
    @events_count = events_count
    generate_users
    generate_groups
    generate_events
    add_users_to_groups
    add_events_to_groups
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

  def generate_events
    events_count.times do |i|
      event = Event.create(name: Faker::Company.name,
                           description: Faker::Lorem.sentences.join,
                           start_time: Faker::Time.forward(rand(0..50), :morning),
                           end_time: Faker::Time.forward(rand(0..50), :evening),
                           location: "Breckenridge"
                           )
    end
    puts "#{events_count} Events created"
  end

  def add_users_to_groups
    users = User.all
    users << User.first(20)
    users.each do |user|
      Group.limit(1).order("RANDOM()").users << user
    end 
  end

  def add_events_to_groups
    events = Event.all
    events.each do |event|
      Group.limit(1).order("RANDOM()").events << event
    end
  end
end

Seed.new
