class AddForeignKeysTasks < ActiveRecord::Migration
  def change
    add_foreign_key :tasks, :users, column: :author_id
    add_foreign_key :tasks, :users, column: :assigned_user_id
  end
end
