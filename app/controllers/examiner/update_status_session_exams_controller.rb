class Examiner::UpdateStatusSessionExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :examiner_permission

  def update
    @session_examination = SessionExamination.find params[:id]
    if @session_examination.update_attributes update_status_session_params
      redirect_to examiner_session_examination_path @session_examination
    else
      flash[:notice] = "Can't update status of this session examination"
      redirect_to examiner_session_examination_path @session_examination
    end
  end

  private
  
  def update_status_session_params
    params.require(:session_examination).permit :status
  end

end
