require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(new_user_session_path)
    end
  end


  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
