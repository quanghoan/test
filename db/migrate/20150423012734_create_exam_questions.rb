class CreateExamQuestions < ActiveRecord::Migration
  def change
    create_table :exam_questions do |t|
      t.integer :examination_id
      t.integer :question_id

      t.timestamps null: false
    end
  end
end