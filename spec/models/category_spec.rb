# frozen_string_literal: true

require "rails_helper"

describe Category do
  describe "associations" do
    it { is_expected.to have_many(:users) }
  end

  describe "validates" do
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
