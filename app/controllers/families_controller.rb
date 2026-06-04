class FamiliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_family, only: [ :show, :edit, :update, :destroy ]



  def show
    @family_members = @family.family_members
    @users = @family.users
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      current_user.update(family: @family)
      redirect_to @family, notice: "Family was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @family.update(family_params)
      redirect_to @family, notice: "Family was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @family.destroy
    redirect_to root_path, notice: "Family was successfully deleted."
  end

  private

  def set_family
    @family = Family.find(params[:id])
  end

  def family_params
    params.require(:family).permit(:name)
  end
end
