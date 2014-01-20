FactoryGirl.define do
  factory :interest do
    sequence(:interest){|n| "interest_#{n}"}
    association :user
  end
end