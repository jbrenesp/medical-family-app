class VaccinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_family_member
  before_action :set_vaccine, only: [ :show, :edit, :update, :destroy ]
  def show
  end

  def new
    @vaccine = @family_member.vaccines.build
  end

  def edit
  end

  def create
     @vaccine = @family_member.vaccines.build(vaccine_params)
    if @vaccine.save
      redirect_to family_family_member_vaccine_path(@family, @family_member, @vaccine), notice: "Vaccine successfully added to #{@family_member.name}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @vaccine.update(vaccine_params)
      redirect_to family_family_member_vaccine_path(@family, @family_member, @vaccine), notice: "Vaccine updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @vaccine.destroy
      redirect_to family_family_member_path(@family, @family_member), notice: "Vaccine deleted"
    end
  end

  private

  def set_family_member
    @family = current_user.family
    @family_member = current_user.family.family_members.find(params[:family_member_id])
  end

  def set_vaccine
    @vaccine = @family_member.vaccines.find(params[:id])
  end

  def vaccine_params
      params.require(:vaccine).permit(:name, :vaccine_date, :dose_number, :next_due_date, :notes)
  end
end
