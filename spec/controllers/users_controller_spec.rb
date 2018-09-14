require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "should have Sign Up" do
      get :new
      expect(response.body).to have_title("Sign Up")
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @user = FactoryBot.create(:user)
    end
  
    it "should be successful" do
      get :show, params: { id: @user }
      expect(response).to have_http_status(:success)
    end
  
    it "should find the right user" do
      get :show, params: { id: @user }
      expect(assigns(:user)).to be == @user
    end

    it "should have the right title" do
      get :show, params: { id: @user }
      expect(response.body).to have_title(@user.name)
    end

    it "should include the user's name" do
      get :show, params: { id: @user }
      expect(response.body).to have_selector("h1", :text => @user.name)
    end

    it "should have a profile image" do
      get :show, params: { id: @user }
      expect(response.body).to have_selector("h1>img", :class => "gravatar")
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "should have the right title" do
      get :new
      expect(response.body).to have_title("Sign Up")
    end
  end

  describe "POST 'create'" do

    describe "failure" do
      before(:each) do
        @attr = { :name => "", :email => "", :password => "",
        :password_confirmation => "" }
      end
      
      it "should not create a user" do
        expect(lambda do
          post :create, params: {:user => @attr}
        end).to_not change(User, :count)
      end
      
      it "should have the right title" do
        post :create, params: {:user => @attr}
        expect(response.body).to have_title("Sign Up")
      end
      
      it "should render the 'new' page" do
        post :create, params: {:user => @attr}
        expect(response).to render_template('new')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :name => "New User", :email => "user@example.com",
          :password => "foobar", :password_confirmation => "foobar" }
      end
      
      it "should create a user" do
        expect(lambda do
          post :create, params: {:user => @attr}
        end).to change(User, :count).by(1)
      end
      
      it "should redirect to the user show page" do
        post :create, params: {:user => @attr}
        expect(response).to redirect_to(user_path(assigns(:user)))
      end

      it "should have a welcome message" do
        post :create, params: {:user => @attr}
        expect(flash[:success]).to match(/welcome to the sample app/i)
      end

    end
  end
end
