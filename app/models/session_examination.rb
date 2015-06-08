class SessionExamination < ActiveRecord::Base
  belongs_to :examination
  has_many :users, through: :user_session_exams
  has_many :user_session_exams, dependent: :destroy

  validates :examination_id, presence: true
  validates :name, presence: true

  after_create :update_status

  def update_status
    self.update_attributes(status: "Ready")
  end
end