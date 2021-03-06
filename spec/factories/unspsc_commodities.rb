# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :unspsc_commodity do
    code { Faker::Number.number(2) }
    long_code { Faker::Number.number(8) }
    description { Faker::Company.bs }
    association :unspsc_class
  end
end
