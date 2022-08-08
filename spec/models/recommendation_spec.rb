# frozen_string_literal: true

require "rails_helper"

describe Recommendation do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:appointment) }
end
