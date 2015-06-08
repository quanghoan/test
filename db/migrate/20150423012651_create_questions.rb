class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :level_category_id
      t.integer :category_id
      t.text    :content
      t.text    :answer_key
      t.integer :type_question_id

      t.timestamps null: false
    end
  end
end