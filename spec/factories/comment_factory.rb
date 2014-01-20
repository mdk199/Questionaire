FactoryGirl.define do
  factory :comment do
    sequence(:comment) {|n| "comment_#{n}" }
    association :user
    association :answer
  end
end
