# frozen_string_literal: true

require "rails_helper"

describe Appointment do
  describe "constants" do
    it { expect(described_class::STATUSES).to eq(%i[pending open close]) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:patient).class_name("User") }
    it { is_expected.to belong_to(:doctor).class_name("User") }
    it { is_expected.to have_one(:recommendation).dependent(:destroy) }
  end

  describe "validates" do
    it { is_expected.to validate_presence_of(:patient_id) }
    it { is_expected.to validate_presence_of(:doctor_id) }
  end
end
