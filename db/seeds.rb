require 'faker'
require "open-uri"

Chatroom.destroy_all
Message.destroy_all
CampaignsAmbassador.destroy_all
Campaign.destroy_all
Restaurant.destroy_all
User.destroy_all


User.create!(email: "user.test@gmail.com", password: "123456", first_name: "user", last_name: "test", username: "Account")
User.create!(email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Job.position)
User.create!(email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Job.position)
p "Users created"


jean = User.create!(email: "jean.rougon@gmail.com", password: "1234567890", first_name: "Jean", last_name: "Rougon", username: "JeanRougon")
jean_ambassador = User.create!(email: "jean.rougon2@gmail.com", password: "1234567890", first_name: "Jean", last_name: "Rougon", username: "JeanRougon2")
lamaison = Restaurant.create!(name: "La maison du burger français", description: "La maison du burger français propose à ses clients un burger français fait maison au goût unique. Nous marions le meilleur du fast-food américain et le meilleur de la cuisine française." , address: "4 rue de la porte", user_id: jean.id)
chatroom = Chatroom.create!(name: "Chatroom La maison du burger français", restaurant_id: lamaison.id)
puts "Jean et la maison du burger créés"
Chatroom.create!(name: "La maison du burger français", restaurant_id: lamaison.id)

date = Faker::Date.in_date_period
file = URI.open('https://mysweetescape.fr/wp-content/uploads/2018/04/burger-chti-maroilles.jpg')
promotion_maroilles = Campaign.create!(description: "Promotion nouveau burger 'Le maroilles'", client_benefit: "-10% sur chaque burger 'Le maroilles' acheté", ambassador_reward: "Un menu offert", start_date: date, end_date: date.next_day, reward_threshold: 5, active: true, restaurant_id: lamaison.id)
promotion_maroilles.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
puts "Burger au maroilles créé"

date2 = Faker::Date.in_date_period
file2 = URI.open('https://mysweetescape.fr/wp-content/uploads/2018/04/burger-chti-maroilles.jpg')

promotion_burger_2 = Campaign.create!(description: "Promotion de burger 'Le simplet'", client_benefit: "-10% sur chaque burger 'Le simplet' acheté", ambassador_reward: "Un menu offert", start_date: date, end_date: date.next_day, reward_threshold: 3, active: true, restaurant_id: lamaison.id)
promotion_burger_2.photo.attach(io: file2, filename: 'nes.png', content_type: 'image/jpg')
puts "Burger le simple créé"

date3 = Faker::Date.in_date_period
file3 = URI.open('https://img-3.journaldesfemmes.fr/bFLBfIV2xQoIMyxLHn-ya2A4jO4=/800x600/smart/3fab692feaaf4aeda820708bbb11ada6/recipe-jdf/10018954.jpg')
promotion_dessert = Campaign.create!(description: "Notre nouveau gâteau au chocolat préféré", client_benefit: "Un gâteau au chocolat acheté = un offert", ambassador_reward: "Un menu offert", start_date: date, end_date: date.next_day, reward_threshold: 3, active: true, restaurant_id: lamaison.id)
promotion_dessert.photo.attach(io: file3, filename: 'nes.png', content_type: 'image/jpg')
puts "Gâteau au chocolat créé"

1.times do
  restaurant_random = Restaurant.create!(name: Faker::Restaurant.name, description: Faker::Restaurant.description, address: Faker::Address.street_address, user_id: User.all.sample.id)
  chatroom = Chatroom.create!(name: restaurant_random.name, restaurant_id: restaurant_random.id)
  p "Restaurant created"
  2.times do
    date = Faker::Date.in_date_period
    Campaign.create!(description: Faker::Lorem.paragraph, client_benefit: "benef", ambassador_reward: "reward",
                     start_date: date, end_date: date.next_day, reward_threshold: 3,
                     active: true, restaurant_id: Restaurant.last.id)
    p "Campaign created"
  end
end

5.times do
  user = User.all.sample
  campaign = Campaign.all.sample.id.to_i
  unless user.campaigns.all.ids.include?(campaign)
    CampaignsAmbassador.create!(user_id: user.id, campaign_id: campaign)
    p "ambassador created"
  end
end

marie = User.create!(email: "marie.macquart@gmail.com", password: "1234567890", first_name: "Marie", last_name: "Macquart", username: "MarieMacquart")
lamaisondemarie = Restaurant.create!(name: "Salad Bar", description: "Un salad bar en plein centre de Paris." , address: "4 rue de la nourriture", user_id: marie.id)
chatroom = Chatroom.create!(name: lamaisondemarie.name, restaurant_id: lamaisondemarie.id)
puts "Marie et la maison de Marie créés"


date5 = Faker::Date.in_date_period
file5 = URI.open('https://www.shutterstock.com/image-photo/salad-tomatoes-cucumber-red-onions-260nw-1086358910.jpg')
promotion_salad = Campaign.create!(description: "Promotion nouvelle salade 5 ingrédients", client_benefit: "-20% sur une salade avec 5 ingrédients", ambassador_reward: "Un menu offert", start_date: date, end_date: date.next_day, reward_threshold: 3, active: true, restaurant_id: lamaisondemarie.id)
promotion_salad.photo.attach(io: file5, filename: 'nes.png', content_type: 'image/jpg')
puts "Première salade créée"


date6 = Faker::Date.in_date_period
file6 = URI.open('https://4.bp.blogspot.com/-3dy-wPcJwiM/Vt2fYHFtIII/AAAAAAAADXM/BYYmMa_jSJQ/s1600/n.JPG')
promotion_salad2 = Campaign.create!(description: "Promotion nouvelle offre", client_benefit: "Un topping offert pour chaque salade achetée", ambassador_reward: "Un topping offert", start_date: date, end_date: date.next_day, reward_threshold: 2, active: true, restaurant_id: lamaisondemarie.id)
promotion_salad2.photo.attach(io: file6, filename: 'nes.png', content_type: 'image/jpg')

puts "Seconde salade créée"


a = CampaignsAmbassador.create(campaign: promotion_salad, user: jean_ambassador)
a.created_at = "2022-10-10 00:00:00"
b = CampaignsAmbassador.create(campaign: promotion_salad, user: jean_ambassador)
a.save!
b.save!
