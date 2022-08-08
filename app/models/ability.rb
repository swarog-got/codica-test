# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :patient
      can_user
    elsif user.has_role? :doctor
      can_doctor
    elsif user.has_role? :admin
      can :manage, :all
    end
  end

  private

  def can_user
    can %i[read new create], Appointment
    can :read, Category
    can :read, Recommendation
    can :read, User.with_role(:doctor)
  end

  def can_doctor
    can :read, Appointment
    cannot :read, Category
    can %i[read new create], Recommendation
    can :read, User.with_role(:patient)
  end
end
