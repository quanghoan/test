class CreateUserSessionExams < ActiveRecord::Migration
  def change
    create_table :user_session_exams do |t|
      t.integer :user_id
      t.integer :session_examination_id

      t.timestamps null: false
    end
  end
end