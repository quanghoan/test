class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.integer :sample_answer_id
      t.integer :answer_sheet_id
      t.integer :question_id

      t.timestamps null: false
    end
  end
end