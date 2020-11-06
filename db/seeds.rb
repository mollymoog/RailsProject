# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
    User.create(
        email: Faker::Internet.email,
        username: Faker::Games::Pokemon.unique.name,
        password: "password"
    )
end

10.times do
    Project.create(
        name: Faker::TvShows::Seinfeld.business,
        description: Faker::TvShows::Seinfeld.quote
    )
end

20.times do
    Outcrop.create(
        location: Faker::TvShows::TwinPeaks.location,
        description: Faker::TvShows::TwinPeaks.quote,
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude,
        project_id: Faker::Number.between(from: 1, to: 10),
        user_id: Faker::Number.between(from: 1, to: 10)
    )
end



