FactoryBot.define do
  factory :user do
    name { Faker::Games::Pokemon.name }
    email { Faker::Internet.email(number:10) }
    is_deleted { boolean:false }
  end
  factory :plot do
    title { Faker::Lorem.characters(number:10) }
    body { Faker::Lorem.characters(number:30) }
  end
end
