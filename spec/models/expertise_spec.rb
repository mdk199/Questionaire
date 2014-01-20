require "spec_helper"
describe Expertise do
  context "when creating an expertise" do
    let(:expertise) {Expertise.new}
    it "validates expertise text" do
      expertise.errors_on(:expertise).should_not be_blank
    end
    it "validates user id" do
      expertise.errors_on(:user_id).should_not be_blank
    end
  end
end