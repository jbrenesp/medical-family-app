require 'rails_helper'

RSpec.describe "Allergies", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/allergies/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/allergies/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/allergies/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/allergies/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/allergies/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
