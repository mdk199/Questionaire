require 'spec_helper'

describe "the signin process" do
	before :each do
    	visit user_session_path
    end

	context "when admin_user is present" do
    let(:confirmation_msg) { "You have to confirm your account before continuing" }
    let(:success_msg) { "Signed in successfully." }
  
    before(:each) { @admin_user = FactoryGirl.create :admin_user }

	    context "and confirmed" do
	      before(:each) do
	        @admin_user.update_attribute(:confirmation_token, nil)
	        @admin_user.update_attribute(:confirmed_at, Time.now)
	      end

	      it "signs me in" do
	        within("#new_user") do
	          fill_in 'user_username', :with => @admin_user.username
	          fill_in 'user_password', :with => @admin_user.password
	        end
	        click_button 'Sign in'
	        expect(page).to have_content success_msg
	      end
	    end

	    context "and not confirmed" do
	      it "asks for account to be confirmed" do
	        within("#new_user") do
	          fill_in 'user_username', :with => @admin_user.username
	          fill_in 'user_password', :with => @admin_user.password
	        end
	        click_button 'Sign in'
	        expect(page).to have_content confirmation_msg
	      end
	    end

	    context "can manage blocked_questions" do
	        before(:each) do
	        	@admin_user.update_attribute(:confirmation_token, nil)
	        	@admin_user.update_attribute(:confirmed_at, Time.now)
	      	end

	    	it "have access to all blocked_questions after sign-in" do
	    		within("#new_user") do
	          		fill_in 'user_username', :with => @admin_user.username
	         		fill_in 'user_password', :with => @admin_user.password
	       		 end
		        click_button 'Sign in'
		        puts page.body
		        expect(page).to have_content success_msg 
		        find_link('Blocked Questions').visible?.should == true
	    	end
	    end
	end
end