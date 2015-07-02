# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

# Users
User.create!(first_name:  "Thomas",
						 last_name:   "Pan",
             email: "thomascpan@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             gender: "male")

User.create!(first_name:  "Foo",
						 last_name:   "Bar",
             email: "foo@bar.com",
             password:              "foobar",
             password_confirmation: "foobar",
             gender: "male")

99.times do |n|
  first_name  = Faker::Name.first_name
  last_name   = Faker::Name.last_name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  gender = rand(2) == 0 ? "male" : "female"
  User.create!(first_name: first_name,
  						last_name: last_name,
              email: email,
              password:              password,
              password_confirmation: password,
              gender: gender)
end

# Microposts
# users = User.order(:created_at).take(6)
# 50.times do
#   content = Faker::Lorem.sentence(5)
#   users.each { |user| user.microposts.create!(content: content) }
# end

# Following relationships
# users = User.all
# user  = users.first
# following = users[2..50]
# followers = users[3..40]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }