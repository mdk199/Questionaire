FactoryGirl.define do
  factory :expertise do
    sequence(:expertise){|n| "Expertise_#{n}"}
    association :user
  end
end