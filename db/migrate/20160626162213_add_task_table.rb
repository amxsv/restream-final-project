class AddTaskTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.timestamps null: false
      t.datetime :due_date, null: false
      t.string :state
      t.integer :author_id
      t.integer :assigned_user_id
    end
  end
end
