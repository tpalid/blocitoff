# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

#create users
10.times do
    user = User.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Lorem.characters(10)
    )
    user.skip_confirmation!
    user.save!
end

#create one user which I can access easily
test_user = User.new(
    name: 'test',
    email: 'tpalid@gmail.com',
    password: 'helloworld'
    )
test_user.skip_confirmation!
test_user.save!

users = User.all

#create items, randomly assigned to users
50.times do
    Item.create!(
        user: users.sample,
        body: Faker::Lorem.sentence,
        created_at: Time.now,
        lifespan: 15
    )
end

50.times do
    Item.create!(
        user: users.sample,
        body: Faker::Lorem.sentence,
        created_at: Date.today - 10.days,
        lifespan: 15
    )
end

#check that seeding was successful
puts "Seed complete"
puts "#{User.count} users created"
puts "#{Item.count} items created"





