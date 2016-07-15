class TaskStateDefault < ActiveRecord::Migration
  def change
    change_column_default :tasks, :state, 'new'
  end
end
