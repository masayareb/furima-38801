FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'a000000'}
    password_confirmation {password}
    firstname {"あ"}
    lastname {"あ"}
    firstname_kana {"ア"} 
    lastname_kana {"ア"}
    date_of_birth {19900101}
  end
end