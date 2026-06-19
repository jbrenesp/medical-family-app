require 'rails_helper'

RSpec.describe FamiliesController, type: :request do
  let(:user) { create(:user) }
  let(:family) { create(:family) }

  before do
    user.update(family: family)
    sign_in user
  end

  describe "GET #show" do
    it "returns http success" do
      get family_path(family)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get new_family_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a family and redirects" do
        post families_path, params: { family: { name: "Test Family" } }
        expect(response).to have_http_status(:redirect)
      end
    end

    context "with invalid params" do
      it "re-renders new" do
        post families_path, params: { family: { name: "" } }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get edit_family_path(family)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      it "updates and redirects" do
        patch family_path(family), params: { family: { name: "Updated Family" } }
        expect(response).to have_http_status(:redirect)
      end
    end

    context "with invalid params" do
      it "re-renders edit" do
        patch family_path(family), params: { family: { name: "" } }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys and redirects to root" do
      delete family_path(family)
      expect(response).to redirect_to(root_path)
    end
  end

 describe "IDOR protection" do
  let(:other_family) { create(:family) }
    it "always shows the signed-in user's own family, never another one" do
      get family_path(other_family)
      expect(response.body).not_to include(other_family.name)
      expect(response.body).to include(family.name)
    end
  end
end
