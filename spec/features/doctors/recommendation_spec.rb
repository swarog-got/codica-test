# frozen_string_literal: true

require "rails_helper"

describe "Create Recommendation", type: :feature do
  it "Doctor creates a new recommendation" do
    doctor = create :user
    patient = create :user
    doctor.remove_role :patient
    doctor.add_role :doctor

    create :appointment, doctor_id: doctor.id, patient_id: patient.id

    sign_in doctor

    visit "/appointments"
    click_link "Добавить в открытые"
    click_link "Посмотреть детали"
    click_link "Написать рекомендацию"
    fill_in "Рекомендация", with: "test"
    click_button "Отправить рекомендацию"

    expect(page).to have_text(I18n.t("recommendation.create.flash.success"))
  end
end
