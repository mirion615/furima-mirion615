FactoryBot.define do
  factory :item do
    title                 { Faker::Lorem.sentence }
    text                  { Faker::Lorem.sentence }
    category_id           { Faker::Number.within(range: 2..11) }
    item_condition_id     { Faker::Number.within(range: 2..7) }
    delivery_charge_id    { Faker::Number.within(range: 2..3) }
    ship_from_id          { Faker::Number.within(range: 2..48) }
    days_to_ship_id       { Faker::Number.within(range: 2..4) }
    item_price            { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:bulid) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image_png')
    end
  end
end
