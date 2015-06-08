class CreateSampleAnswers < ActiveRecord::Migration
  def change
    create_table :sample_answers do |t|
      t.boolean :is_correct
      t.text :content
      t.integer :question_id

      t.timestamps null: false
    end
  end
end