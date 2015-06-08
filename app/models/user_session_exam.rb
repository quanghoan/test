class UserSessionExam < ActiveRecord::Base
  belongs_to :user
  belongs_to :session_examination
  has_many :answer_sheets

  def get_questions
    self.session_examination.examination.questions
  end
end