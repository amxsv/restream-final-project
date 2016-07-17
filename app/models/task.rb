class Task < ActiveRecord::Base
  include Authority::Abilities

  belongs_to :author, class_name: 'User'
  belongs_to :assigned_user, class_name: 'User'

  validates_presence_of :title, :description, :due_date, :author, :assigned_user

  self.authorizer_name = 'TaskAuthorizer'

  def overdue?
    Time.zone.parse(due_date.to_s) < Time.zone.now
  end
end
