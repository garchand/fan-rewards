require 'faker'

Restaurant.destroy_all


User.create!(email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Job.position)
p "User created"

10.times do
  Restaurant.create!(name: Faker::Restaurant.name, description: Faker::Restaurant.description, address: Faker::Address.street_address, user_id: User.last.id)
  p "Restaurant created"
end
