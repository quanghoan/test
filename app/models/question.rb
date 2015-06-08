class Question < ActiveRecord::Base
  has_many :sample_answers, dependent: :destroy
  has_many :examinations, through: :exam_questions
  has_many :exam_questions
  has_many :answers
  belongs_to :type_question
  belongs_to :level_category
  belongs_to :category

  validates :type_question_id, presence: true

  accepts_nested_attributes_for :sample_answers

  def is_choice_question?
    self.type_question.name == "Choice question"
  end
end