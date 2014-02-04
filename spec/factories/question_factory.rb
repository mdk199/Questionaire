FactoryGirl.define do
  factory :question do
    sequence(:question) {|n| "question_#{n}" }
    association :user
  end

  factory :published_question, :parent => :question do
    published true
  end

  factory :blocked_questions, :parent => :question do
    after(:create) do |question|
      question.update_attribute('flags_count',5)
    end
  end

  factory :question_with_tags, :parent => :question do
    after(:create) do |question|
      question.tag_list = ['tag1', 'tag2']
      question.save
      question.reload
    end
  end
end