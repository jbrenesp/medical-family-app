class CheckupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_family_member
  before_action :set_checkup, only: [ :show, :edit, :update, :destroy ]

  def index
    @checkups = @family_member.checkups.order(date: :desc)
  end

  def show
  end

  def new
    @checkup = @family_member.checkups.build
  end

  def edit
  end

  def create
    @checkup = @family_member.checkups.build(checkup_params)
    if @checkup.save
      redirect_to family_family_member_checkup_path(@family, @family_member, @checkup), notice: "Checkup successfully added to #{@family_member.name}"
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @checkup.update(checkup_params)
      redirect_to family_family_member_checkup_path(@family, @family_member, @checkup), notice: "Checkup successfully updated"
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    if @checkup.destroy
      redirect_to family_family_member_path(@family, @family_member), notice: "Checkup successfully deleted."
    end
  end

  private

  def set_family_member
    @family = current_user.family
    @family_member = current_user.family.family_members.find(params[:family_member_id])
  end

  def set_checkup
    @checkup = @family_member.checkups.find(params[:id])
  end

  def checkup_params
    params.require(:checkup).permit(:checkup_type, :date, :notes, :results)
  end
end
