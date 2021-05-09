FactoryBot.define do
  factory :purchase_address do
    postal_code   {'123-4567'}
    ship_from_id  { Faker::Number.within(range: 2..48) }
    city          { Gimei.city.kanji }
    house_number  { Gimei.town.kanji }
    building_name { '東京ハイツ' }
    phone_number  {Faker::Number.leading_zero_number(digits: 10)}
  end
end
