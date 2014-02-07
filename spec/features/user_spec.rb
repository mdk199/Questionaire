require "spec_helper"

describe "the signin process" do
  before :each do
    visit user_session_path
  end

  context "when user is present" do
    let(:confirmation_msg) { "You have to confirm your account before continuing" }
    let(:success_msg) { "Signed in successfully." }
  
    before(:each) { @user = FactoryGirl.create :user }

    context "and confrimed" do
      before(:each) do
        @user.update_attribute(:confirmation_token, nil)
        @user.update_attribute(:confirmed_at, Time.now)
      end

      it "signs me in" do
        within("#new_user") do
          fill_in 'user_username', :with => @user.username
          fill_in 'user_password', :with => @user.password
        end
        click_button 'Sign in'
        puts page.body
        expect(page).to have_content success_msg
      end
    end

    context "and not confrimed" do
      it "asks for account to be confirmed" do
        within("#new_user") do
          fill_in 'user_username', :with => @user.username
          fill_in 'user_password', :with => @user.password
        end
        click_button 'Sign in'
        expect(page).to have_content confirmation_msg
      end
    end
  end

  context "when user is not present" do
    let(:invalid_user_msg) { "Invalid Username or password" }
    let(:fake_username) {"fake_username"}
    let(:fake_pass) {"fake_pass"}

    it "prompt invalid user/password error" do
      
      within("#new_user") do
        fill_in 'user_username', :with => fake_username
        fill_in 'user_password', :with => fake_pass
      end
      click_button 'Sign in'
      expect(page).to have_content invalid_user_msg
    end
  end
end