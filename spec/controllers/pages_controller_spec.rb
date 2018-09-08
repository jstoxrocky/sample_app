require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  render_views

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end

    it "should have the right title" do
      get :home
      expect(response.body).to have_title("Ruby on Rails Tutorial Sample App | Home")
    end
  end

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end

    it "should have the right title" do
      get :contact
      expect(response.body).to have_title("Ruby on Rails Tutorial Sample App | Contact")
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end

    it "should have the right title" do
      get :about
      expect(response.body).to have_title("Ruby on Rails Tutorial Sample App | About")
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end

    it "should have the right title" do
      get :help
      expect(response.body).to have_title("Ruby on Rails Tutorial Sample App | Help")
    end
  end

end
