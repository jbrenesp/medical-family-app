# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @family = current_user.family
    @family_member = @family.family_members.find(params[:family_member_id]) if params[:family_member_id].present?
    @summary = FamilyHealthSummary.new(@family, family_member: @family_member, year: params[:year]&.to_i)
  end
end
