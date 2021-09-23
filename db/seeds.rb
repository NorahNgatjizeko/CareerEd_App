# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(
  name: "Admin user",
  email: "admin@gmail.com",
  password: "password",
  password_confirmation: "password",
  admin: true
)
user.save!
User.create!(name: 'GuestUser1',
             email: 'guest1234@example1.com',
             password: '12345678',
             password_confirmation: '12345678',
             created_at: Time.zone.now,
             updated_at: Time.zone.now,
             admin: true)
User.create!(name: 'Guest UserAdmin',
             email: 'guestadmin@example2.com',
             password: '12345678',
             password_confirmation: '12345678',
             created_at: Time.zone.now,
             updated_at: Time.zone.now,
             admin: true)
User.create!(name: 'Guest User',
             email: 'gues1t@example3.com',
             password: '12345678',
             password_confirmation: '12345678',
             created_at: Time.zone.now,
             updated_at: Time.zone.now,
             guest: true)
