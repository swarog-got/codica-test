# frozen_string_literal: true

class Admins::CategoriesController < Admins::AdminController
  before_action :set_category, only: %i[show update edit destroy]

  def index
    @q = Category.ransack(params[:q])
    @q.sorts = "created_at desc" if @q.sorts.empty?
    @pagy, @categories = pagy(@q.result, items: 10)
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = t("categories.create.flash.success")
    else
      flash[:alert] = t("categories.create.flash.alert")
    end

    redirect_to action: :index
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:notice] = t("categories.edit.flash.success")
    else
      flash[:alert] = t("categories.edit.flash.alert")
    end

    redirect_to action: :index
  end

  def destroy
    return unless @category.destroy

    flash[:notice] = t("categories.destroy.flash.success")
    redirect_to action: :index
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :users)
  end
end
