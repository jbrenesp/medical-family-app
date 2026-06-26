class AllergiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_family_member
  before_action :set_allergy, only: [ :show, :edit, :update, :destroy ]

  def index
    @allergies = @family_member.allergies.order(diagnosed_date: :desc)
  end

  def show
  end

  def new
    @allergy = @family_member.allergies.build
  end

  def create
    @allergy = @family_member.allergies.build(allergy_params)
    if @allergy.save
      redirect_to family_family_member_allergy_path(@family, @family_member, @allergy), notice: "Allergy successfully added to #{@family_member.name}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @allergy.update(allergy_params)
      redirect_to family_family_member_allergy_path(@family, @family_member, @allergy), notice: "Allergy updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @allergy.destroy
      redirect_to family_family_member_path(@family, @family_member), notice: "Allergy deleted"
    end
  end

  private

  def set_family_member
    @family = current_user.family
    @family_member = current_user.family.family_members.find(params[:family_member_id])
  end

  def set_allergy
    @allergy = @family_member.allergies.find(params[:id])
  end

  def allergy_params
      params.require(:allergy).permit(:name, :allergy_type, :notes, :diagnosed_date, :severity)
  end
end
