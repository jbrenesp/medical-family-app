require 'rails_helper'

RSpec.describe CheckupsController, type: :request do
  let(:user) { create(:user) }
  let(:family) { create(:family) }
  let(:family_member) { create(:family_member, family: family) }
  let(:checkup) { create(:checkup, family_member: family_member) }

  before do
    user.update(family: family)
    sign_in user
  end

  describe "GET #show" do
    it "returns http success" do
      get family_family_member_checkup_path(family, family_member, checkup)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get new_family_family_member_checkup_path(family, family_member)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a checkup and redirects" do
        post family_family_member_checkups_path(family, family_member), params: { checkup: { checkup_type: "general", date: "2026-01-01" } }
        expect(response).to have_http_status(:redirect)
      end
    end

    context "with invalid params" do
      it "re-renders new" do
        post family_family_member_checkups_path(family, family_member), params: { checkup: { checkup_type: "blood_test" } }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get edit_family_family_member_checkup_path(family, family_member, checkup)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      it "updates and redirects" do
        patch family_family_member_checkup_path(family, family_member, checkup), params: { checkup: { checkup_type: "dental" } }
        expect(response).to have_http_status(:redirect)
      end
    end

    context "with invalid params" do
      it "re-renders edit" do
        patch family_family_member_checkup_path(family, family_member, checkup), params: { checkup: { checkup_type: "" } }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys and redirects" do
      delete family_family_member_checkup_path(family, family_member, checkup)
      expect(response).to redirect_to(family_family_member_path(family, family_member))
    end
  end

  describe "IDOR protection" do
    let(:other_family) { create(:family) }
    let(:other_family_member) { create(:family_member, family: other_family) }
    let(:other_checkup) { create(:checkup, family_member: other_family_member) }

    it "cannot access another family's checkup" do
      get family_family_member_checkup_path(other_family, other_family_member, other_checkup)
      expect(response).not_to have_http_status(:success)
    end
  end
end
