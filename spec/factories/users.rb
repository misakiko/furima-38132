FactoryBot.define do
  factory :user do
    person = Gimei.name

    # 漢字、カナが生成されるgem
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { person.last.kanji }
    first_name { person.first.kanji }
    last_name_kana { person.last.katakana }
    first_name_kana { person.first.katakana }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end

# passwordに('1a'+Faker...)すると英数混合に
