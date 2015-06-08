class CreateTimeInfos < ActiveRecord::Migration
  def change
    create_table :time_infos do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer  :user_session_exam_id

      t.timestamps null: false
    end
  end
end