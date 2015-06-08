class Examination < ActiveRecord::Base
  has_many :questions, through: :exam_questions
  has_many :exam_questions, dependent: :destroy
  has_many :session_examinations, dependent: :destroy

  validates :time_limit, presence: true
  validates :name, presence: true

  def is_running?
    self.session_examinations.where(status: "Started").count > 0
  end
end