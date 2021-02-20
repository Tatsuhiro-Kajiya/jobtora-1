FactoryBot.define do
  factory :spot do
    name        {"〇〇ホテル"}
    genre_id    {2}
    place_id    {2}
    explanation {"絶景が望めるホテル"}
    plan        {"1泊宿泊プラン"}
    wifi_id     {2}
    budget      {100000}

    association :user

    after(:build) do |spot|
      spot.image.attach(io: File.open('public/images/testhotel.jpeg'), filename: 'testhotel.jpeg')
    end
  end
end
