FactoryBot.define do
  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    balance { 100.00 }
  end

  factory(:pokemon) do
    name { Faker::Games::Pokemon.name }
    weight { 10 }
    height { 70 }
    image_path { Faker::Games::Pokemon.location }
    price { 10.01 }
  end
end