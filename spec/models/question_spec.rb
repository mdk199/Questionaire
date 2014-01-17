require "spec_helper"

describe Question do

  context "when creating a new question" do
    let(:question) { FactoryGirl.create :question }

    before(:each) {
      question.user = nil
      question.question = nil
      question.save
    }
    it "validates question text" do
      question.errors_on(:question).should_not be_blank
    end

    it "validates user" do
      question.errors_on(:user_id).should_not be_blank
    end
  end

  context "when published questions present in db" do
    before(:each) { FactoryGirl.create :published_question }
    
    it "returns published questions only" do
      Question.published_questions.count.should == 1
    end

    it "faltu" do
      question = FactoryGirl.create :question_with_tags
      puts question.tags.inspect
    end
  end
end