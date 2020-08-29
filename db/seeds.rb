# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroying Orders...'
Order.destroy_all
puts 'Destroying EBoxes...'
EBox.destroy_all
puts 'Destroying Payments...'
Payment.destroy_all
puts 'Destroying Retrievers...'
Retriever.destroy_all
puts 'Destroying Deliverer Addresses...'
DelivererAddress.destroy_all
puts 'Destroying Addresses...'
Address.destroy_all
puts 'Destroying Users...'
User.destroy_all

puts 'Creating new Users...'
puts 'Creating first User as admin...'

first_user = User.create!(
    email: 'john@doe.com', 
    password: '123456', 
    first_name: 'John', 
    last_name: 'Doe',
    mobile: '11987654321',
    document: '01234567890',
    admin: true
)
puts 'Creating second User...'
second_user = User.create!(
    email: 't@t', 
    password: '123456', 
    first_name: 'João', 
    last_name: 'Esmanhoto',
    mobile: '11987654321',
    document: '01234567890',
    admin: false
)

puts 'Creating Addresses...'
first_address = Address.create!(
    street: 'Rua dos Caetés',
    number: '885',
    complement: 'apto. 112',
    neighborhood: 'Perdizes',
    city: 'São Paulo',
    state: 'SP',
    zip: '05016081'
)
second_address = Address.create!(
    street: 'Rua Mourato Coelho',
    number: '1404',
    complement: 'sala 21',
    neighborhood: 'Vila Madalena',
    city: 'São Paulo',
    state: 'SP',
    zip: '05016081'
)
puts 'Assigning addresses to users...'
DelivererAddress.create!(user: first_user, address: first_address)
DelivererAddress.create!(user: second_user, address: second_address)
puts 'Creating E-Boxes...'
e_box_1 = EBox.create!(
    e_box_code: 'e-box-1-code',
    compartiment_size: 'small',
)
e_box_2 = EBox.create!(
    e_box_code: 'e-box-2-code',
    compartiment_size: 'medium',
)
puts 'Creating Payments...'
first_payment = Payment.create!(
    card_number: "1234 5678 9012 3456",
    card_holder: "#{first_user.first_name} #{first_user.last_name}",
    expiry_date: "07/2025",
    cvv: "123"
)

puts 'Creating Retriver...'
retriever = Retriever.create!(
    email: 'jane@doe.com', 
    first_name: 'Jane', 
    last_name: 'Doe',
    mobile: '01234567890',
    document: '0987654321',
)

puts 'Assingning first order'
deliver = Deliver.create!(
    user: first_user,
    e_box: e_box_1,
    qr_code: 'hjvgowi73u7ujcnxa9w87xujfcpkdc'
)
retrieval = Retrieval.create!(
    retriever: retriever,
    e_box: e_box_2,
    qr_code: 'hjvgowi73u7ujcnxa9w87xujfcpkdc'
)

puts 'Creating Orders...'
Order.create!(
    payment: first_payment, 
    price_in_cents: 1000, 
    retrieval: retrieval,
    deliver: deliver
)