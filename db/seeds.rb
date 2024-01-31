# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Alert.destroy_all
Coin.destroy_all

Coin.create!([ {sym: 'ABCD', price: 123.01},
               {sym: 'EFGH', price: 234},
               {sym: 'IJKL', price: 456.67},
               {sym: 'MNOP', price: 789.09},
               {sym: 'QRST', price: 908.5},
               {sym: 'UVW',  price: 351.2},
               {sym: 'XYZ',  price: 123.5},
             ])
User.create!([ {username: 'user1', password_digest: BCrypt::Password.create('pass1'), email: 'email1@example.com', bio: nil},
               {username: 'user2', password_digest: BCrypt::Password.create('pass2'), email: 'email2@example.com', bio: nil},
               {username: 'user3', password_digest: BCrypt::Password.create('pass3'), email: 'email3@example.com', bio: nil},
               {username: 'user4', password_digest: BCrypt::Password.create('pass4'), email: 'email4@example.com', bio: nil}
             ])
all_users = User.all
user1 = all_users[0].id
user2 = all_users[1].id
user3 = all_users[2].id
user4 = all_users[3].id

coin1 = Coin.all[0].id
coin2 = Coin.all[1].id
coin3 = Coin.all[2].id
coin4 = Coin.all[3].id
coin5 = Coin.all[4].id
coin6 = Coin.all[5].id
coin7 = Coin.all[6].id

Alert.create!([ {user_id: user1, coin_id: coin1, status: 'created', price: 125},
                {user_id: user1, coin_id: coin2, status: 'triggered', price: 236},
                {user_id: user1, coin_id: coin3, status: 'created', price: 400},
                {user_id: user1, coin_id: coin4, status: 'created', price: 700},
                {user_id: user2, coin_id: coin2, status: 'deleted', price: 125},
                {user_id: user2, coin_id: coin1, status: 'created', price: 125},
                {user_id: user2, coin_id: coin4, status: 'created', price: 125},
                {user_id: user2, coin_id: coin5, status: 'created', price: 340},
                {user_id: user2, coin_id: coin6, status: 'created', price: 750},
                {user_id: user2, coin_id: coin2, status: 'created', price: 200},
                {user_id: user2, coin_id: coin1, status: 'triggered', price: 125},
                {user_id: user2, coin_id: coin3, status: 'created', price: 125},
                {user_id: user2, coin_id: coin7, status: 'created', price: 100},
                {user_id: user3, coin_id: coin1, status: 'created', price: 125},
                {user_id: user3, coin_id: coin2, status: 'triggered', price: 125},
                {user_id: user3, coin_id: coin3, status: 'created', price: 125},
                {user_id: user3, coin_id: coin4, status: 'triggered', price: 125},
                {user_id: user3, coin_id: coin5, status: 'created', price: 125},
                {user_id: user3, coin_id: coin6, status: 'triggered', price: 125},
                {user_id: user3, coin_id: coin3, status: 'deleted', price: 125},
                {user_id: user3, coin_id: coin7, status: 'created', price: 240},
                {user_id: user4, coin_id: coin1, status: 'deleted', price: 125},
                {user_id: user4, coin_id: coin2, status: 'triggered', price: 125},
                {user_id: user4, coin_id: coin3, status: 'deleted', price: 125},
                {user_id: user4, coin_id: coin4, status: 'created', price: 125},
                {user_id: user4, coin_id: coin5, status: 'triggered', price: 125},
                {user_id: user4, coin_id: coin6, status: 'created', price: 125},
                {user_id: user4, coin_id: coin7, status: 'created', price: 125},
                {user_id: user4, coin_id: coin1, status: 'triggered', price: 125},
                {user_id: user4, coin_id: coin2, status: 'created', price: 125},
                {user_id: user4, coin_id: coin3, status: 'created', price: 125},
              ])
