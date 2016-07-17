class Task < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :assigned_user, class_name: 'User'

  validates_presence_of :title, :description, :due_date, :author, :assigned_user

  def overdue?
    Time.zone.parse(due_date.to_s) < Time.zone.now
  end
end
