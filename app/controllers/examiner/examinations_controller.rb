class Examiner::ExaminationsController < ApplicationController
  before_action :authenticate_user!
  before_action :examiner_permission

  def show
    @examination = Examination.find params[:id]
    @questions = @examination.questions
  end

  def index
    @examinations = Examination.page(params[:page]).per(10)
  end

  def new
    @examination = Examination.new
  end

  def create
    @examination = Examination.new examination_params
    if @examination.save
      flash[:notice] = "An examination has been created"
      redirect_to examiner_exam_question_path @examination
    else
      render "new"
    end
  end

  def edit
    @examination = Examination.find params[:id]
  end

  def update
    @examination = Examination.find params[:id]
    if @examination.update_attributes examination_params
      flash[:notice] = "Examination has been updated"
      redirect_to examiner_examination_path @examination
    else
      render "edit"
    end
  end

  def destroy
    @examination = Examination.find params[:id]
    @examination.destroy
    flash[:notice] = "Examination has been deleted"
    redirect_to examiner_examinations_path
  end

  private
  def examination_params
    params.require(:examination).permit :name, :description, :time_limit
  end
end
