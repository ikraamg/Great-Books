class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?, only: %i[edit update destroy create]
  before_action :find_category, only: %i[edit update destroy]

  def index
    @indexed_categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)
    if @category.save
      flash[:success] = 'Category successfully created'
    else
      flash[:error] = 'Unable to create, please ensure that you fill in the details'
    end
    redirect_to categories_path
  end

  def update
    if @category.update_attributes(categories_params)
      flash[:success] = 'Category was successfully updated'
    else
      flash[:error] = 'Unable to update, please ensure that you fill in the details'
    end
    redirect_to categories_path
  end

  def destroy
    if @category.destroy
      flash[:success] = 'Category was successfully deleted.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to categories_path
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def categories_params
    params.require(:category).permit(:id, :name, :priority)
  end

  def admin?
    return if current_user == User.find_by(email: 'admin@admin.com')

    flash[:error] = 'Please login as Administrator'
    redirect_to categories_path
  end
end
