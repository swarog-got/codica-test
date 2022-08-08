# frozen_string_literal: true

class User < ApplicationRecord
  before_create :assign_default_role

  GENDER = %w[Мужской Женский].freeze

  rolify

  belongs_to :category, optional: true
  has_many :doctor_appointments, class_name: "Appointment", foreign_key: :patient_id, dependent: :destroy
  has_many :patient_appointments, class_name: "Appointment", foreign_key: :doctor_id, dependent: :destroy
  has_many :doctors, through: :doctor_appointments, source: :doctor, dependent: :destroy
  has_many :patients, through: :patient_appointments, source: :patient, dependent: :destroy
  has_many :recommendations, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:phone]

  validates :phone, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  private

  def assign_default_role
    add_role(:patient) if roles.blank?
  end
end
