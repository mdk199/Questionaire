describe "the signin process", :type => :feature do
  before :each do
    user = FactoryGirl.create :user
  end

  it "signs me in" do
    GET user_session_path
    within("#session") do
      fill_in 'username', :with => user.username
      fill_in 'password', :with => user.password
    end
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end