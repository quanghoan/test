class AnswerSheet < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :time_info
  belongs_to :user_session_exam
  belongs_to :user

  accepts_nested_attributes_for :answers

  after_create :update_time_info

  def score
    answers = self.answers
    answers.select{|answer| answer.is_correct}.count
  end

  def get_user
    self.user_session_exam.user
  end

  def get_examination
    self.user_session_exam.session_examination.examination
  end

  def update_time_info
    self.time_info.update_attributes(end_time: self.created_at)
  end
end
