FactoryBot.define do
  factory :user do
    person = Gimei.name  
    # 漢字、カナが生成されるgem
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name { person.last.kanji.katakana }
    first_name { person.first.kanji.katakana }
    last_name_kana { person.last.katakana }
    first_name_kana { person.first.katakana }
  end
end