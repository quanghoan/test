class Examiner::RelationshipsController < ApplicationController
  def show
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes relationship_params
      flash[:notice] = "This category has been update parrents"
    else
      flash[:alert] = "Something wrong, so you can't update"
    end
    redirect_to examiner_category_path @category
  end

  private
  def relationship_params
    params.require(:category).permit parrent_ids: []
  end
end