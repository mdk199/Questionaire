FactoryGirl.define do
  factory :answer do
    sequence(:answer) {|n| "answer_#{n}" }
    association :user
    association :question
  end

  factory :approved_answer, :parent => :answer do
    approved true
  end
end