FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    telephone_number { '12345678901' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
