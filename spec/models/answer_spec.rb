require "spec_helper"

describe Answer do
	context "when creating an answer" do
		let(:answer) {Answer.new}
		it "validates answer text" do
			answer.errors_on(:answer).should_not be_blank
		end
		it "validates user id" do
			answer.errors_on(:user_id).should_not be_blank
		end
		it "validates question id" do
			answer.errors_on(:question_id).should_not be_blank
		end
	end
	context "checking for answer approved" do
		it "answer is approved or not" do
			answer = Answer.create({:answer=>"some answer1", :user_id=>1, :question_id=>1})
			answer1 = Answer.create({:answer=>"some answer1", :user_id=>1, :question_id=>1})
			answer.should_not be_is_approved
			answer1.approve
			answer.should be_is_approved
		end
	end

end