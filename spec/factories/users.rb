FactoryBot.define do
  factory :user do
    name { test }
    email { test@test.com }
    password { testtest }
    is_deleted { false }
  end
end
