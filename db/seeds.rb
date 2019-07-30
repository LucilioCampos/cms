# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do
  kind = Kind.create(
    name: Faker::Name.name,
    description: Faker::Lorem.sentence(4)
  )
end

10.times do
  user = User.create(
    name: Faker::Name.name,
    status: :active,
    kind: :manager,
    notes: Faker::Lorem.sentence(10)
  )
end