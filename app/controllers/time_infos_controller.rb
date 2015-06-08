class TimeInfosController < ApplicationController
  def create
    @time_info = TimeInfo.new time_info_params
    if @time_info.save
      flash[:notice] = "Starting exam"
      redirect_to new_answer_sheet_path(time_info_id: @time_info.id)
    else
      flash[:notice] = "Cann't start this exam"
      redirect_to user_path current_user
    end
  end

  private
  def time_info_params
    params.require(:time_info).permit :start_time, :end_time,
      :user_session_exam_id
  end
end