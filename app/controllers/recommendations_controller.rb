# frozen_string_literal: true

class RecommendationsController < ApplicationController
  def new
    @recommendation = current_user.recommendations.build
  end

  def create
    @recommendation = current_user.recommendations.build(recommendation_params)

    if @recommendation.save
      appointment_status_close(@recommendation)
      flash[:notice] = t("recommendation.create.flash.success")
    else
      flash[:alert] = t("recommendation.create.flash.alert")
    end

    redirect_to user_path(current_user)
  end

  private

  def appointment_status_close(recommendation)
    recommendation.appointment.update(status: Appointment.status.close)
  end

  def recommendation_params
    params.require(:recommendation).permit(:user_id, :answer).merge(appointment_id: params[:appointment_id])
  end
end
