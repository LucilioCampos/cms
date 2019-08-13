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
    phones: [
      Phone.create(
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

puts 'Criando Documentos para usuários'
cont = 1
10.times do
  Document.create(
    kind: %i[cpf rg cne].sample,
    num: Faker::IDNumber.valid,
    user_id: cont
  )
  cont += 1
end
puts 'Documentos para usuários criado'

puts 'Criando Documentos para clientes'
cont = 1
10.times do
  Document.create(
    kind: %i[cpf rg cne].sample,
    num: Faker::IDNumber.valid,
    client_id: cont
  )
  cont += 1
end
puts 'Documentos para usuários clientes'

puts 'Criando um Produto'
10.times do
  Product.create(
    kind_id: Kind.all.sample.id,
    description: Faker::Lorem.sentence(5),
    status: %i[active inactive].sample,
    price: 10.99
  )
end

puts 'Criando os discontos'
10.times do
  Discount.create(
    name: Faker::FunnyName.name,
    description: Faker::Lorem.sentence(3),
    kind: %i[percentage money].sample,
    status: %i[active inactive].sample,
    value: rand(1.5..3.0)
  )
end
puts 'Descontos Criados'

puts 'Criando as vendas'
10.times do
  Sale.create(
    client_id: Client.all.sample.id, 
    user_id: User.all.sample.id,
    discount_id: nil,
    notes: Faker::Lorem.sentence(3)
  )
end
puts 'Vendas criadas'

puts 'Criando as Quantidade de produtos'
10.times do
  ProductQuantity.create(
    product_id: Product.all.sample.id,
    quantity: rand(1..100)
  )
end