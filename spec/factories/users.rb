FactoryBot.define do
  factory :user do
    email_address { Faker::Internet.email }
    password { PASSWORD_FOR_USER }
    password_confirmation { PASSWORD_FOR_USER }
  end
end
