class AnswerSheetsController < ApplicationController
  before_action :authenticate_user!

  def show
    @answer_sheet = AnswerSheet.find params[:id]
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"#{@answer_sheet.id}.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def new
    @answer_sheet = AnswerSheet.new
    @time_info = TimeInfo.find params[:time_info_id]
    user_session_exam = UserSessionExam.find(@time_info.user_session_exam_id)
    @questions = user_session_exam.get_questions
  end

  def create
    @answer_sheet = AnswerSheet.new answer_sheet_params
    @answer_sheet.user_id = current_user.id
    if @answer_sheet.get_examination.is_running?
      if @answer_sheet.save
        flash[:notice] = "You have completed this examination"
        redirect_to answer_sheet_path @answer_sheet
      else
        flash[:alert] = "Can't submit"
        redirect_to root_path
      end
    else
      flash[:alert] = "You can't submit now. This examination has been paused by examiner"
      redirect_to root_path
    end
  end

  private
  def answer_sheet_params
    params.require(:answer_sheet).permit(:user_session_exam_id, :time_info_id, :user_id,
      answers_attributes: [:id, :sample_answer_id, :content, :question_id])
  end
end
