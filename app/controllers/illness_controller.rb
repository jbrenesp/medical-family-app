class IllnessesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_family_member
  before_action :set_illness, only: [ :show, :edit, :update, :destroy ]

  def show
  end

  def new
    @illness = @family_member.illnesses.build
  end

  def create
    @illness = @family_member.illnesses.build(illness_params)
    if @illness.save
      redirect_to family_family_member_illness_path(@family, @family_member, @illness), notice: "Illness correctly added to #{@family_member.name}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @illness.update(illness_params)
      redirect_to family_family_member_illness_path(@family, @family_member, @illness), notice: "Illness was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @illness.destroy
    redirect_to family_family_member_path(@family, @family_member), notice: "Illness was successfully deleted."
  end

  private

  def set_family_member
    @family = current_user.family
    @family_member = current_user.family.family_members.find(params[:family_member_id])
  end

  def set_illness
    @illness = @family_member.illnesses.find(params[:id])
  end

  def illness_params
      params.require(:illness).permit(:name, :start_date, :end_date, :notes)
  end
end
