# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Criando os Tipos'
10.times do
  kind = Kind.create(
    name: Faker::Name.name,
    description: Faker::Lorem.sentence(4)
  )
end
puts 'Tipos Criados!'

puts 'Criando usuários'
10.times do
  user = User.create(
    name: Faker::Name.name,
    status: :active,
    kind: :manager,
    notes: Faker::Lorem.sentence(10),
    phones: [
      Phone.create(
        kind: :fix,
        num: Faker::PhoneNumber.phone_number
      )
    ],
    addresses: [
      Address.create(
        state: [ 
          "AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", 
          "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", 
          "RJ", "RN", "RO", "RS", "RR", "SC", "SE", "SP", "TO"
        ].sample,
        city: Faker::Address.city,
        neighborhood: Faker::Address.street_name,
        street: Faker::Address.street_name,
        notes: Faker::Lorem.sentence(5)
      )
    ]
  )
end
puts 'Usuários criados!!'

puts 'Criando Clientes'
10.times do
  client = Client.create(
    name: Faker::Name.name,
    company: Faker::Company.name,
    email: Faker::Internet.email,
    user: User.all.sample,
    notes: Faker::Lorem.sentence(5),
    status: :active,
    phones: [Phone.create(
      kind: :fix,
      num: Faker::PhoneNumber.phone_number
    )],
    addresses: [
      Address.create(
        state: [ 
          "AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", 
          "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", 
          "RJ", "RN", "RO", "RS", "RR", "SC", "SE", "SP", "TO"
        ].sample,
        city: Faker::Address.city,
        neighborhood: Faker::Address.street_name,
        street: Faker::Address.street_name,
        notes: Faker::Lorem.sentence(5)
      )
    ]
  )
end
puts 'Clientes Criados'