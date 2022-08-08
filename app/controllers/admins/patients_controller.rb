# frozen_string_literal: true

class Admins::PatientsController < Admins::AdminController
  before_action :set_patient, only: :destroy

  def index
    @q = User.with_role(:patient).ransack(params[:q])
    @q.sorts = "created_at desc" if @q.sorts.empty?
    @pagy, @patients = pagy(@q.result, items: 10)
  end

  def show; end

  def destroy
    return unless @patient.destroy

    flash[:notice] = t("patients.destroy.flash.success")
    redirect_to action: :index
  end

  private

  def set_patient
    @patient = User.find(params[:id])
  end
end
