# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

3.times do |i|
  User.create(email: "pierre#{i}@testseven#{i}.com", password: "pierre#{i}pierre", balance: i * 7.00)
end

Pokemon.create(name: 'Bulbasaur', weight: 7, height: 70, image_path: 'https://bulbapedia.bulbagarden.net/wiki/Bulbasaur_(Pok%C3%A9mon)', price: 10)
Pokemon.create(name: 'Ivysaur', weight: 13, height: 100, image_path: 'https://bulbapedia.bulbagarden.net/wiki/Ivysaur_(Pok%C3%A9mon)', price: 20)
Pokemon.create(name: 'Venusaur', weight: 155, height: 200, image_path: 'https://bulbapedia.bulbagarden.net/wiki/Venusaur_(Pok%C3%A9mon)', price: 100)
Pokemon.create(name: 'Charmander', weight: 8, height: 60, image_path: 'https://bulbapedia.bulbagarden.net/wiki/Charmander_(Pok%C3%A9mon)', price: 10)
Pokemon.create(name: 'Charmeleon', weight: 19, height: 110, image_path: 'https://bulbapedia.bulbagarden.net/wiki/Charmeleon_(Pok%C3%A9mon)', price: 20)
Pokemon.create(name: 'Charizard', weight: 91, height: 170, image_path: 'https://bulbapedia.bulbagarden.net/wiki/Charizard_(Pok%C3%A9mon)', price: 100)
Pokemon.create(name: 'Squirtle', weight: 9, height: 50, image_path: 'https://bulbapedia.bulbagarden.net/wiki/Charmander_(Pok%C3%A9mon)', price: 10)
Pokemon.create(name: 'Wartortle', weight: 22, height: 100, image_path: 'https://bulbapedia.bulbagarden.net/wiki/Wartortle_(Pok%C3%A9mon)', price: 20)
Pokemon.create(name: 'Blastoise', weight: 85, height: 160, image_path: 'https://bulbapedia.bulbagarden.net/wiki/Blastoise_(Pok%C3%A9mon)', price: 100)