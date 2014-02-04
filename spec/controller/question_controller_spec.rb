describe "GET #index" do 
	it "populates an array of questions" do
		question = Factory(:question)
		get :index
		assigns(:question).should eq([question])
	end
	it "renders the :index view" do
		get :index response.should render_template
		:index
	end
end