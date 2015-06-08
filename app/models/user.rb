class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :session_examinations, through: :user_session_exams
  has_many :user_session_exams, dependent: :destroy
  has_many :answer_sheets

  def is_admin?
    self.role == 'admin'
  end

  def is_examiner?
    self.role == 'examiner'
  end

  def get_answer_sheets
    self.user_session_exams.map(& :answer_sheets).flatten
  end
end