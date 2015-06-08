class Examiner::UserSessionExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :examiner_permission

  def show
    @users = User.all
    @session_examination = SessionExamination.find params[:id]
  end

  def update
    @session_examination = SessionExamination.find params[:id]
    if @session_examination.update_attributes user_session_exam_params
      flash[:notice] = "Examinees has been changed"
      redirect_to examiner_session_examination_path @session_examination
    else
      flash[:notice] = "Can't changed"
      redirect_to examiner_session_examination_path @session_examination
    end
  end

  private
  def user_session_exam_params
    params.require(:session_examination).permit user_ids: []
  end
end
