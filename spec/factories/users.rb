FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'test1234TEST'}
    password_confirmation {password}
    family_name           { person.last.kanji }
    first_name            { person.first.kanji }
    family_name_kana      { person.first.katakana }
    first_name_kana       { person.last.katakana }
    birth_date            {Faker::Date.backward}
  end
end