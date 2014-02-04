describe "GET #index" do 
	it "populates an array of questions" do
		question = Factory(:question)
		get :index
		assigns(:question).should eq([question])
	end
	it "renders the :index view" do
		get :index response.should render_template :index
	end
end

describe "GET #show" do
	it "assigns the requested question to @question" do
		question = Factory(:question)
		get :show, id: question
		assigns(:question).should eq(question)
	end
	it "renders the #show view" do
		get :show, id: Factory(:question)
		response.should render_template :show
	end
end

describe "POST create" do
	context "with valid attributes" do
		it "creates a new question" do
			expect{
				post :create, question: Factory.attributes_for(:question)
			}.to change(question,:count).by(1)
		end
		it "redirects to the new question" do
			post :create, question: Factory.attributes_for(:question)
			response.should redirect_to question.last
		end
	end
	context "with invalid attributes" do
		it "does not save the new question" do
			expect{
				post :create, question: Factory.attributes_for(:invalid_question)
			}.to_not change(question,:count)
		end
		it "re-renders the new method" do
			post :create, question: Factory.attributes_for(:invalid_question)
			response.should render_template :new
		end
	end
end