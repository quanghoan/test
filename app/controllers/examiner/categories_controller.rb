class Examiner::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :examiner_permission

  def show
    @category = Category.find params[:id]
    @questions = @category.questions
  end

  def index
    @categories = Category.page(params[:page]).per(10)
  end

  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new category_params
    @categories = Category.all
    if @category.save
      flash[:notice] = "Category has been created"
      redirect_to examiner_relationship_path @category
    else
      render "new"
      redirect_to examiner_categories_path
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes category_params
      flash[:notice] = "This category has been updated"
      redirect_to examiner_category_path @category
    else
      flash[:alert] = "Something wrong"
      redirect_to examiner_categories_path
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    flash[:alert] = "This category has been deleted"
    redirect_to examiner_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name, :description
  end
end
