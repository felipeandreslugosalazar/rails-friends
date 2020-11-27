# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def users_seed(users_qty)
  puts "Creating users..."

  User.create(email: "admin@test.com", password: "123456")
  puts "Admin created!"
  User.create(email: "user1@test.com", password: "123456")
  puts "User1 created!"
  User.create(email: "user2@test.com", password: "123456")
  puts "User2 created!"

  users_qty.times.with_index do |u, i|
    puts "Creating user no. #{i + 1}"
    User.create(
      email: Faker::Internet.email,
      password: "123456",
    )
    puts "User no. #{i + 1} created!"
  end
  puts "Users created!"
end

def friends_seed(friends_qty)
  puts "Creating friends"

  friends_qty.times.with_index do |f, i|
    puts "Creating friend no. #{i + 1}"
    full_name = Faker::FunnyName.two_word_name.split
    domain = Faker::Artist.name

    Friend.create(
      first_name: full_name[0],
      last_name: full_name[1],
      email: "#{full_name[0]}.#{full_name[1]}@#{domain}",
      phone: Faker::PhoneNumber.phone_number_with_country_code,
      extra: Faker::Nation.language,
      user_id: User.all.sample.id,
    )

    puts "Friend no. #{i + 1} created!"
  end
  puts "Friends created!"
end

users_qty = 10
friends_qty = 50

users_seed(users_qty)
friends_seed(friends_qty)
