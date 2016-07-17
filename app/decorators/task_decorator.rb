class TaskDecorator < ApplicationDecorator
  delegate_all

  def mark_overdue
    overdue? ? 'bg-danger' : ''
  end
end
