class FamilyMembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_family
  before_action :set_family_member, only: [ :show, :edit, :update, :destroy ]

  def show
  end

  def new
    @family_member = @family.family_members.build
  end

  def create
    @family_member = @family.family_members.build(family_member_params)
    if @family_member.save
      redirect_to family_family_member_path(@family, @family_member), notice: "Family member was successfully created."
    else
        render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @family_member.update(family_member_params)
      redirect_to family_family_member_path(@family, @family_member), notice: "Family member updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @family_member.destroy
    redirect_to root_path, notice: "Family member was successfully deleted."
  end

  private

  def set_family
    @family = Family.find(params[:family_id])
  end

  def set_family_member
    @family_member = @family.family_members.find(params[:id])
  end

  def family_member_params
    params.require(:family_member).permit(:name, :date_of_birth, :member_type, :is_private, :blood_type, :family_id)
  end
end
