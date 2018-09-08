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

end
