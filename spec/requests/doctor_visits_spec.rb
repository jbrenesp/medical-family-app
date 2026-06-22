require 'rails_helper'

RSpec.describe DoctorVisitsController, type: :request do
  let(:user) { create(:user) }
  let(:family) { create(:family) }
  let(:family_member) { create(:family_member, family: family) }
  let(:doctor_visit) { create(:doctor_visit, family_member: family_member) }

  before do
    user.update(family: family)
    sign_in user
  end

  describe "GET #show" do
    it "returns http success" do
      get family_family_member_doctor_visit_path(family, family_member, doctor_visit)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get new_family_family_member_doctor_visit_path(family, family_member)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a doctor visit and redirects" do
        post family_family_member_doctor_visits_path(family, family_member), params: { doctor_visit: { doctor_name: "Doctor", visit_date: "2026-01-01", visit_type: "checkup" } }
        expect(response).to have_http_status(:redirect)
      end
    end

    context "with invalid params" do
      it "re-renders new" do
        post family_family_member_doctor_visits_path(family, family_member), params: { doctor_visit: { doctor_name: "" } }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get edit_family_family_member_doctor_visit_path(family, family_member, doctor_visit)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      it "updates and redirects" do
        patch family_family_member_doctor_visit_path(family, family_member, doctor_visit), params: { doctor_visit: { doctor_name: "Updated Name" } }
        expect(response).to have_http_status(:redirect)
      end
    end

    context "with invalid params" do
      it "re-renders edit" do
        patch family_family_member_doctor_visit_path(family, family_member, doctor_visit), params: { doctor_visit: { doctor_name: "" } }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys and redirects" do
      delete family_family_member_doctor_visit_path(family, family_member, doctor_visit)
      expect(response).to redirect_to(family_family_member_path(family, family_member))
    end
  end

  describe "IDOR protection" do
    let(:other_family) { create(:family) }
    let(:other_family_member) { create(:family_member, family: other_family) }
    let(:other_doctor_visit) { create(:doctor_visit, family_member: other_family_member) }

    it "cannot access another family's doctor_visit" do
      get family_family_member_doctor_visit_path(other_family, other_family_member, other_doctor_visit)
      expect(response).not_to have_http_status(:success)
    end
  end
end
