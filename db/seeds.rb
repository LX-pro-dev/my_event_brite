# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

20.times do |i|
  User.create(
    email: i.to_s+"coco@yopmail.com",
    encrypted_password: Faker::Internet.password(min_length: 10, max_length: 20),
    description: Faker::Lorem.paragraph(sentence_count: 4),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name)
end

30.times do
  Event.create(
    start_date: Faker::Time.between(from: DateTime.now - 14, to: DateTime.now, format: :default),
    duration: rand(1..12) * 5,
    title: Faker::Movie.title,
    description: Faker::Lorem.characters(number: 4),
    price: rand(1..1000),
    location: Faker::Address.city)
end

40.times do
  Attendance.create(
    user_id: User.all.sample.id,
    event_id: Event.all.sample.id,
    stripe_customer_id: Faker::Internet.password(min_length: 10, max_length: 20))
end