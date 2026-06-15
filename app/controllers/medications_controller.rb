class MedicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_family_member
  before_action :set_medication, only: [ :show, :edit, :update, :destroy ]
  def show
  end

  def new
    @medication = @family_member.medications.build
  end

  def create
    @medication = @family_member.medications.build(medication_params)
    if @medication.save
      redirect_to family_family_member_medication_path(@family, @family_member, @medication), notice: "Medication successfully added to #{@family_member.name}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @medication.update(medication_params)
      redirect_to family_family_member_medication_path(@family, @family_member, @medication), notice: "Medication was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @medication.destroy
    redirect_to family_family_member_path(@family, @family_member), notice: "Medication was successfully deleted."
  end

  private
  def set_family_member
    @family = current_user.family
    @family_member = current_user.family.family_members.find(params[:family_member_id])
  end

  def set_medication
    @medication = @family_member.medications.find(params[:id])
  end

  def medication_params
      params.require(:medication).permit(:name, :notes, :start_date, :medication_type, :end_date, :illness_id)
  end
end
