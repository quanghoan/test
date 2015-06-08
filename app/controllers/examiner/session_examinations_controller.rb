class Examiner::SessionExaminationsController < ApplicationController
  before_action :authenticate_user!
  before_action :examiner_permission

  def show
    @session_examination = SessionExamination.find params[:id]
    @examinees = @session_examination.users
  end

  def index
    @session_examinations = SessionExamination.page(params[:page]).per(10)
  end

  def new
    @session_examination = SessionExamination.new
    @examinations = Examination.all
  end

  def create
    @session_examination = SessionExamination.new session_exam_params
    @examinations = Examination.all
    if @session_examination.save
      flash[:notice] = "A session examination has been created"
      redirect_to examiner_user_session_exam_path @session_examination
    else
      render "new"
    end
  end

  def edit
    @session_examination = SessionExamination.find params[:id]
    @examinations = Examination.all
  end

  def update
    @session_examination = SessionExamination.find params[:id]
    if @session_examination.update_attributes session_exam_params
      flash[:notice] = "The session examination has been updated"
      redirect_to examiner_session_examination_path
    else
      render "edit"
    end
  end

  def destroy
    @session_examination = SessionExamination.find params[:id]
    @session_examination.destroy
    flash[:notice] = "The session examination has been deleted"
    redirect_to examiner_session_examinations_path
  end

  private
  def session_exam_params
    params.require(:session_examination).permit(:name,
      :examination_id, :status, :description)
  end
end
