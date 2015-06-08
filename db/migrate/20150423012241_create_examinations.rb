class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.string :name
      t.text :description
      t.integer :time_limit

      t.timestamps null: false
    end
  end
end