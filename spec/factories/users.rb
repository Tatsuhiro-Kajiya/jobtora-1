FactoryBot.define do
  factory :user do
    nickname                {"yama"}
    last_name               {"yamada"}
    first_name              {"tarou"}
    age                     {20}
    email                   {"yamada@gmail.com"}
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
  end
end
