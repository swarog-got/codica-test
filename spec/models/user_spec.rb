# frozen_string_literal: true

require "rails_helper"

describe User do
  describe "constants" do
    it { expect(described_class::GENDER).to eq(%w[Мужской Женский]) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:category).optional(true) }

    it do
      is_expected.to have_many(:doctor_appointments).class_name("Appointment")
        .with_foreign_key(:patient_id).dependent(:destroy)
    end

    it do
      is_expected.to have_many(:patient_appointments).class_name("Appointment")
        .with_foreign_key(:doctor_id).dependent(:destroy)
    end

    it { is_expected.to have_many(:doctors).through(:doctor_appointments).source(:doctor) }
    it { is_expected.to have_many(:patients).through(:patient_appointments).source(:patient) }
    it { is_expected.to have_many(:recommendations).dependent(:destroy) }
  end

  describe "validates" do
    it { is_expected.to validate_uniqueness_of(:phone) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end
end
