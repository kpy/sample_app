namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 6)
    time_start = 2.weeks.ago
    10.times do |n|
      starttime = time_start + n.days + n.hours
      endtime = starttime + 1.hour
      title = Faker::Lorem.sentence(1)
      description = Faker::Lorem.sentence(3)
      place = Faker::Lorem.sentence(1)
      users.each { |user| user.appointments.create!(starttime: starttime,
          endtime: endtime, title: title, description: description, place: place) }
    end
  end
end