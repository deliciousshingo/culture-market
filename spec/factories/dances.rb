FactoryBot.define do
  factory :dance do
    association :user
    title { 'Hello' }
    genre_id { 2 }
    price { 500 }
    introduce { 'Hello' }
    reservation_time { '1930-02-01' }
  end
end
