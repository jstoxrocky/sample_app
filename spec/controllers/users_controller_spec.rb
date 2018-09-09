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

end
