require "spec_helper"

describe UsersController do
	before(:each) do
		@user = FactoryGirl.create(:user)
		@user.update_attribute(:confirmation_token, nil)
       	@user.update_attribute(:confirmed_at, Time.now)
		@admin_user = FactoryGirl.create(:admin_user)
		@admin_user.update_attribute(:confirmation_token, nil)
       	@admin_user.update_attribute(:confirmed_at, Time.now)
       	sign_in @admin_user
	end

	describe "activity_log" do
	    it "renders the activity log template" do
	      get :activity_log
	      expect(response).to render_template("activity_log")
	    end
	end

	describe "manage users" do
 		it "Should render manage users" do
 			get :users
 			normal_users = assigns(:users)
 			normal_users.should_not be_empty
	    	expect(response).to render_template("index")
		end
 	end
 	
end