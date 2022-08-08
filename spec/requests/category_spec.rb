# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Categories", type: :request do
  describe "GET /new" do
    let(:user) { create(:user) }

    before do
      sign_in user

      user.add_role :admin
    end

    it "creates a Category and redirects to the Categories page" do
      get "/admins/categories/new"
      expect(response).to render_template(:new)

      post "/admins/categories", params: { category: { name: Faker::String.random } }
      expect(response).to redirect_to(action: :index)
      follow_redirect!
      expect(response.body).to include(I18n.t("categories.create.flash.success"))
    end
  end
end
