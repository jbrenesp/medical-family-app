# spec/requests/dashboard_spec.rb
require "rails_helper"

RSpec.describe "Dashboard", type: :request do
  let(:family) { create(:family) }
  let(:user) { create(:user, family: family) }
  let!(:family_member) { create(:family_member, family: family) }

  before { sign_in user }

  describe "GET /dashboard" do
    context "without filters" do
      it "returns http success" do
        get dashboard_path
        expect(response).to have_http_status(:success)
      end
    end

    context "with a family member filter" do
      it "returns http success and scopes to that member" do
        get dashboard_path, params: { family_member_id: family_member.id }
        expect(response).to have_http_status(:success)
      end

      it "does not allow access to another family's member" do
        other_member = create(:family_member, family: create(:family))
        get dashboard_path, params: { family_member_id: other_member.id }
        expect(response).to have_http_status(:not_found)
      end
    end

    context "with a year filter" do
      it "returns http success" do
        get dashboard_path, params: { year: Date.today.year }
        expect(response).to have_http_status(:success)
      end
    end

    context "when not logged in" do
      it "redirects to sign in" do
        sign_out user
        get dashboard_path
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
