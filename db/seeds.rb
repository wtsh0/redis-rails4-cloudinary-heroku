# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
today = Time.now()

Manager.create!(
  email: "1@gmail.com",
  password: "asdf1234"
  created_at: today,
  confirmation_sent_at: today.ago(1.days),
  confirmed_at: today.ago(1.days).since(3.minutes),
  last_sign_in_at: today.ago(1.days).since(3.minutes)
)

