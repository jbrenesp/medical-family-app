class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes

  before_action :require_family!

  private

  def require_family!
    return unless user_signed_in?
    return if current_user.family.present?
    return if request.path == new_family_path || request.path == families_path

    redirect_to new_family_path, alert: "Please create a family to get started."
  end
end
