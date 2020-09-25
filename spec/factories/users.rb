FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    profile {"Hello"}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end
