require 'rails_helper'

RSpec.describe "DoctorVisits", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/doctor_visits/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/doctor_visits/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/doctor_visits/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/doctor_visits/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/doctor_visits/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/doctor_visits/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
