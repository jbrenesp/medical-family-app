class PagesController < ApplicationController
  def home
    redirect_to family_path(current_user.family) if user_signed_in?
  end

  def about
  end
end
