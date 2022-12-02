require 'faker'
require "open-uri"

CampaignsAmbassador.destroy_all
Campaign.destroy_all
Restaurant.destroy_all
User.destroy_all

User.create!(email: "user.test@gmail.com", password: "123456", first_name: "user", last_name: "test", username: "Account")
User.create!(email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Job.position)
User.create!(email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Job.position)
p "Users created"

3.times do
  Restaurant.create!(name: Faker::Restaurant.name, description: Faker::Restaurant.description, address: Faker::Address.street_address, user_id: User.all.sample.id)
  p "Restaurant created"
  2.times do
    date = Faker::Date.in_date_period
    Campaign.create!(description: Faker::Lorem.paragraph, client_benefit: "benef", ambassador_reward: "reward",
                     start_date: date, end_date: date.next_day, reward_threshold: 3,
                     active: true, restaurant_id: Restaurant.last.id)
    p "Campaign created"
  end
end

10.times do
  user = User.all.sample
  campaign = Campaign.all.sample.id.to_i
  unless user.campaigns.all.ids.include?(campaign)
    CampaignsAmbassador.create!(user_id: user.id, campaign_id: campaign)
    p "ambassador created"
  end
end


jean = User.create!(email: "jean.rougon@gmail.com", password: "1234567890", first_name: "Jean", last_name: "Rougon", username: "JeanRougon")
lamaison = Restaurant.create!(name: "La maison du burger français", description: "La maison du burger français propose à ses clients un burger français fait maison au goût unique. Nous marions le meilleur du fast-food américain et le meilleur de la cuisine française." , address: "4 rue de la porte", user_id: jean.id)
puts "Jean et la maison du burger créés"

date = Faker::Date.in_date_period
file = URI.open('https://mysweetescape.fr/wp-content/uploads/2018/04/burger-chti-maroilles.jpg')
promotion_maroilles = Campaign.create!(description: "Promotion nouveau burger 'Le maroilles'", client_benefit: "-10% sur chaque burger 'Le maroilles' acheté", ambassador_reward: "Un menu offert pour 5 nouvelles recommandations obtenues", start_date: date, end_date: date.next_day, reward_threshold: 5, active: true, restaurant_id: lamaison.id)
promotion_maroilles.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
puts "Burger au maroilles créé"

date2 = Faker::Date.in_date_period
file2 = URI.open('https://scontent-cdt1-1.cdninstagram.com/v/t51.2885-15/317156509_176088028426053_2161313780694425130_n.jpg?stp=dst-jpg_e35_p640x640_sh0.08&_nc_ht=scontent-cdt1-1.cdninstagram.com&_nc_cat=109&_nc_ohc=v-bOnJMWFlMAX9AxXMn&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=Mjk4MTQwNjgyMTQxMTEzMDA1NQ%3D%3D.2-ccb7-5&oh=00_AfBUzCjZYPkiQafGmj8JsTCJHONIuNal5H54dfuS6njG8Q&oe=638F1732&_nc_sid=30a2ef')
promotion_burger_2 = Campaign.create!(description: "Promotion de burger 'Le simplet'", client_benefit: "-10% sur chaque burger 'Le simplet' acheté", ambassador_reward: "Un menu offert pour 3 nouvelles recommandations obtenues", start_date: date, end_date: date.next_day, reward_threshold: 3, active: true, restaurant_id: lamaison.id)
promotion_burger_2.photo.attach(io: file2, filename: 'nes.png', content_type: 'image/jpg')
puts "Burger le simpelt créé"

date3 = Faker::Date.in_date_period
file3 = URI.open('https://scontent-cdt1-1.cdninstagram.com/v/t51.2885-15/317156509_176088028426053_2161313780694425130_n.jpg?stp=dst-jpg_e35_p640x640_sh0.08&_nc_ht=scontent-cdt1-1.cdninstagram.com&_nc_cat=109&_nc_ohc=v-bOnJMWFlMAX9AxXMn&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=Mjk4MTQwNjgyMTQxMTEzMDA1NQ%3D%3D.2-ccb7-5&oh=00_AfBUzCjZYPkiQafGmj8JsTCJHONIuNal5H54dfuS6njG8Q&oe=638F1732&_nc_sid=30a2ef')
promotion_dessert = Campaign.create!(description: "Notre nouveau gâteau au chocolat préféré", client_benefit: "Un gâteau au chocolat acheté = un gâteau au chocolat gratuit", ambassador_reward: "Un menu offert pour 3 nouvelles recommandations obtenues", start_date: date, end_date: date.next_day, reward_threshold: 3, active: true, restaurant_id: lamaison.id)
promotion_dessert.photo.attach(io: file3, filename: 'nes.png', content_type: 'image/jpg')
puts "Gâteau au chocolat créé"
