FactoryBot.define do
  factory :comment do
    title {'おすすめのホテルです'}
    evaluation_id {2}
    review {'最高でした!!'}
    association :user
    association :spot
  end
end
