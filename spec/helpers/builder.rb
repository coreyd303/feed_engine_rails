module SpecBuilders

  def make_trip
    Trip.create(name:        "BroDown",
                description: "Getting the shred on!",
                date:        Time.new(2014, 11, 11),
                resort_id:   4
                )
  end

  def make_trips
    15.times do
      make_trip
    end
  end

  def make_user
    User.create(name:        "Joe Bro",
                email:       "joebro@example.com"
                )
  end

  def make_users
    15.times do
      make_user
    end
  end
end