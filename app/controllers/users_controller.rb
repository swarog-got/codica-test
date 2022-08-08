# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[update edit]

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = t("user.edit.flash.success")
    else
      flash[:alert] = t("user.edit.flash.alert")
    end

    redirect_to action: :show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone,
                                 :born_date, :gender, :patient_appointments,
                                 :doctor_appointments)
  end
end
