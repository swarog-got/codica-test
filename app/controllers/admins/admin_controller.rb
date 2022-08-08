# frozen_string_literal: true

class Admins::AdminController < ApplicationController
  before_action :block_no_admin_users

  protected

  def block_no_admin_users
    return if current_user.has_role?(:admin)

    flash[:alert] = "Ошибка доступа"
    redirect_to user_path(current_user)
  end
end
