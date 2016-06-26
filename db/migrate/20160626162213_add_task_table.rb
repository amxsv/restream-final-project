class AddTaskTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.timestamps null: false
      t.datetime :due_date, null: false
      t.string :state
    end
  end
end
