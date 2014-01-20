FactoryGirl.define do
	factory :comment do
		sequence(:comment){|n| "Comment_#{n}"}
		association :answer
		association :user
		end
end