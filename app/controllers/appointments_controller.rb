# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update]

  def index
    @q = scope_user.ransack(params[:q])
    @q.sorts = "created_at desc" if @q.sorts.empty?
    @pagy, @appointments = pagy(@q.result, items: 10)
  end

  def show; end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      flash[:notice] = t("appointment.create.flash.success")
    else
      flash[:alert] = t("appointment.create.flash.alert")
    end

    redirect_to user_path(current_user)
  end

  def edit; end

  def update
    if limit_appointment_with_open_status && @appointment.update(status: Appointment.status.open)
      flash[:notice] = t("appointment.update.flash.success")
    else
      flash[:alert] = t("appointment.update.flash.alert")
    end

    redirect_to appointments_path
  end

  private

  def limit_appointment_with_open_status
    Appointment.where(status: Appointment.status.open).size <= 10
  end

  def scope_user
    current_user.has_role?(:doctor) ? current_user.patient_appointments : current_user.doctor_appointments
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :title, :question, :status)
  end
end
