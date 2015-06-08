class Answer < ActiveRecord::Base
  belongs_to :sample_answer
  belongs_to :answer_sheet
  belongs_to :question

  delegate :is_correct, to: :sample_answer, allow_nil: true
end