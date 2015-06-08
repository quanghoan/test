class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :parrent_id
      t.integer :child_id

      t.timestamps null: false
    end
  end
end