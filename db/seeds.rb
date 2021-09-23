User.create!(name: 'GuestUser1',
             email: 'guest1234@example.com',
             password: '12345678',
             password_confirmation: '12345678',
             created_at: Time.zone.now,
             updated_at: Time.zone.now,
             admin: true)
User.create!(name: 'Guest UserAdmin',
             email: 'guestadmin@example.com',
             password: '12345678',
             password_confirmation: '12345678',
             created_at: Time.zone.now,
             updated_at: Time.zone.now,
             admin: true)
User.create!(name: 'Guest User',
             email: 'gues1t@example.com',
             password: '12345678',
             password_confirmation: '12345678',
             created_at: Time.zone.now,
             updated_at: Time.zone.now,
             guest: true)
user = User.find_or_initialize_by(email: 'admin1@gmail.com')
user.name = 'Admin'
user.password = 'admin@12345'
user.admin = 'true'
user.save!
