FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "123456" }
    description { "MyText" }
    first_name { "MyString" }
    last_name { "MyString" }
  end
end