# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(nick_name: "Allie", email: "asr@gmail.com", password: "welcome")
user2 = User.create!(nick_name: "Kate", email: "katierox@gmail.com", password: "welcome123")
10.times do
  user.shares.create(title: FFaker::Book.title, url: FFaker::Internet.http_url)
end


Share.last.comments.create!(user: user, body: "This is pretty cool")
Share.first.comments.create!(user: user, body: "What's the deal?")
Share.last.comments.create!(user: user2, body: "Go home!")
Share.first.comments.create!(user: user2, body: "Stahp it")
