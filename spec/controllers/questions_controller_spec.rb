require "spec_helper"

describe QuestionsController do
	before(:each) do
		@admin_user = FactoryGirl.create(:admin_user)
		@admin_user.update_attribute(:confirmation_token, nil)
       	@admin_user.update_attribute(:confirmed_at, Time.now)
       	sign_in @admin_user
       	FactoryGirl.create(:blocked_questions)
	end

	describe "all_questions" do
	    it "renders the index template" do
	      get :all_questions
	      expect(response).to render_template("all_question")
	    end
	end

	describe "blocked" do
 		it "Should render index" do
 			get :blocked
 			blocked_questions = assigns(:questions)
 			blocked_questions.should_not be_empty
	    	expect(response).to render_template("index")
		end
 	end
 	
end