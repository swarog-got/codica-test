# frozen_string_literal: true

class Admins::DoctorsController < Admins::AdminController
  before_action :set_doctor, only: %i[show update edit destroy]

  def index
    @q = User.with_role(:doctor).ransack(params[:q])
    @q.sorts = "created_at desc" if @q.sorts.empty?
    @pagy, @doctors = pagy(@q.result, items: 10)
  end

  def show; end

  def new
    @doctor = User.new
  end

  def create
    @doctor = User.new(doctor_params)
    @doctor.add_role :doctor

    if @doctor.save
      flash[:notice] = t("doctors.create.flash.success")
    else
      flash[:alert] = t("doctors.create.flash.alert")
    end

    redirect_to action: :index
  end

  def edit; end

  def update
    if @doctor.update(doctor_params)
      flash[:notice] = t("doctors.edit.flash.success")
    else
      flash[:alert] = t("doctors.edit.flash.alert")
    end

    redirect_to action: :index
  end

  def destroy
    return unless @doctor.destroy

    flash[:notice] = t("doctors.destroy.flash.success")
    redirect_to action: :index
  end

  private

  def set_doctor
    @doctor = User.find(params[:id])
  end

  def doctor_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone,
                                 :password, :category_id, :password_confirmation,
                                 :gender, :born_date)
  end
end
