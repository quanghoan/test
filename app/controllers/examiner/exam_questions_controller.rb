class Examiner::ExamQuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :examiner_permission
  
  def show
    @questions = Question.all
    @examination = Examination.find params[:id]
  end

  def update
    @examination = Examination.find params[:id]
    unless @examination.is_running?
      if @examination.update_attributes exam_question_params
        flash[:notice] = "Set of questions has been updated"
      else
        flash[:notice] = "Can't update set of questions"
      end
    else
      flash[:alert] = "This examination is running, so you can't change questions"
    end
    redirect_to examiner_examination_path @examination
  end

  private
  def exam_question_params
    params.require(:examination).permit question_ids: []
  end
end