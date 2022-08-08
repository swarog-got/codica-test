# frozen_string_literal: true

class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :appointment
end
