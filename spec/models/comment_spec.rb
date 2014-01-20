require "spec_helper"

describe Comment do
	context "when creating a comment" do
		let(:comment) {Comment.new}
		it "validates comments text" do
			comment.errors_on(:comment).should_not be_blank
		end
		it "validates user id" do
			comment.errors_on(:user_id).should_not be_blank
		end
		it "validates question id" do
			comment.errors_on(:answer_id).should_not be_blank
		end
	end
end