require "spec_helper"

describe Question do

  context "when creating a new question" do
    let(:question) { Question.new }

    it "validates question text" do
      question.errors_on(:question).should_not be_blank
    end

    it "validates user" do
      question.errors_on(:user_id).should_not be_blank
    end
  end

  context "when published questions present in db" do
    it "returns published questions only" do
      user = User.create({:username => "test", :password => "password", :password_confirmation => "password", :email => "test@example.com"})
      puts user.inspect
      Question.create({:question => "some question...", :user_id => user.id, :published => true})
      Question.create({:question => "some question...", :user_id => user.id, :published => false})
      
      puts Question.all
      Question.published_questions.count.should == 1
    end
  end

end