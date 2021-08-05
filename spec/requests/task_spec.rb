require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/task/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/task/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/task/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/task/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
