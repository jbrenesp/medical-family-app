class DoctorVisitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_family_member
  before_action :set_doctor_visit, only: [ :show, :edit, :update, :destroy ]


  def index
    @doctor_visits = @family_member.doctor_visits.order(visit_date: :desc)
  end

  def show
  end

  def new
    @doctor_visit = @family_member.doctor_visits.build
  end

  def create
    @doctor_visit = @family_member.doctor_visits.build(doctor_visit_params)
    if @doctor_visit.save
      redirect_to family_family_member_doctor_visit_path(@family, @family_member, @doctor_visit), notice: "Doctor visit successfully added to #{@family_member.name}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @doctor_visit.update(doctor_visit_params)
      redirect_to family_family_member_doctor_visit_path(@family, @family_member, @doctor_visit), notice: "Doctor visit was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor_visit.destroy
    redirect_to family_family_member_path(@family, @family_member), notice: "Doctor visit was successfully deleted."
  end

  private
  def set_family_member
    @family = current_user.family
    @family_member = current_user.family.family_members.find(params[:family_member_id])
  end

  def set_doctor_visit
    @doctor_visit = @family_member.doctor_visits.find(params[:id])
  end

  def doctor_visit_params
      params.require(:doctor_visit).permit(:doctor_name, :doctor_city, :notes, :visit_date, :visit_type, :illness_id)
  end
end
