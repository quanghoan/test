class TimeInfo < ActiveRecord::Base
  has_one :answer_sheet

  def get_time_limit
    user_session_exam = UserSessionExam.find(self.user_session_exam_id)
    user_session_exam.session_examination.examination.time_limit.minutes.to_i
  end
end