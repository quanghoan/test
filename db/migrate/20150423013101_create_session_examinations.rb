class CreateSessionExaminations < ActiveRecord::Migration
  def change
    create_table :session_examinations do |t|
      t.integer :examination_id
      t.string :name
      t.text :description
      t.string :status

      t.timestamps null: false
    end
  end
end