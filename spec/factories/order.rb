FactoryBot.define do
  factory :order do
    token { 'tok_abcdefghijk00000000000000000' }
    post_cord { '000-0000' }
    area_id { 3 }
    city { Faker::Address.city }
    block_number { Faker::Address.street_address }
    building { Faker::Address.building_number }
    phone_number { '0000000000' }
  end
end
