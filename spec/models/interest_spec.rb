require "spec_helper"

describe Interest do

	context "when creating an interest" do

    	let(:interest) {FactoryGirl.create :interest}
    	it "validates interest text" do
    	  	interest.errors_on(:interest).should be_blank
	    end
        it "validates user id" do
    		interest.errors_on(:user_id).should be_blank
    	end
	end
end