class Examiner::LevelCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :examiner_permission

  def show
    @level_category = LevelCategory.find params[:id]
    @questions = @level_category.questions
  end

  def index
    @level_categories = LevelCategory.page(params[:page]).per(10)
  end

  def new
    @level_category = LevelCategory.new
  end

  def create
    @level_category = LevelCategory.new level_category_params
    if @level_category.save
      flash[:notice] = "A level category has been created"
      redirect_to examiner_level_category_path @level_category
    else
      render "new"
    end
  end

  def edit
    @level_category = LevelCategory.find params[:id]
  end

  def update
    @level_category = LevelCategory.find params[:id]
    if @level_category.update_attributes level_category_params
      flash[:notice] = "Level category has been updated"
      redirect_to examiner_level_category_path @level_category
    else
      render "edit"
    end
  end

  def destroy
    @level_category = LevelCategory.find params[:id]
    @level_category.destroy
    flash[:notice] = "Level category has been delete"
    redirect_to examiner_level_categories_path
  end

  private
  def level_category_params
    params.require(:level_category).permit :name, :description
  end
end
