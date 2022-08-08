# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @q = Category.ransack(params[:q])
    @categories = @q.result
  end

  def show
    @category = Category.find(params[:id])
    @pagy, @category_doctors = pagy(@category.users, items: 18)
  end
end
