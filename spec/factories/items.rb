FactoryBot.define do
  factory :item do
    item                {'test'}
    content             {'testtesttest'}
    category_id         {'3'}
    status_id           {'2'}
    shipping_cost_id    {'2'}
    prefecture_id       {'2'}
    days_to_ship_id     {'2'}
    price               {3000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end

