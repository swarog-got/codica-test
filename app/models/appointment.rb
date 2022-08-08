# frozen_string_literal: true

class Appointment < ApplicationRecord
  extend Enumerize

  STATUSES = %i[pending open close].freeze

  belongs_to :patient, class_name: "User"
  belongs_to :doctor, class_name: "User"
  has_one :recommendation, dependent: :destroy

  validates :patient_id, presence: true
  validates :doctor_id, presence: true

  enumerize :status, in: STATUSES
end
