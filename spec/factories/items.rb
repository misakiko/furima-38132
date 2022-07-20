FactoryBot.define do
  factory :item do
    item_name { Faker::Name.name }
    messages { Faker::Lorem.sentence }
    category_id { 3 }
    situation_id { 2 }
    price_bear_id { 3 }
    area_id { 3 }
    days_id { 2 }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end
