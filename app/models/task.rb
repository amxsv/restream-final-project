class Task < ActiveRecord::Base
  include Authority::Abilities

  belongs_to :author, class_name: 'User'
  belongs_to :assigned_user, class_name: 'User'

  validates_presence_of :title, :description, :due_date, :author

  self.authorizer_name = 'TaskAuthorizer'

  state_machine :state, initial: :new do
    before_transition new: :assigned, do: :check_assigned

    event :archive do
      transition [:new, :accepted] => :archived
    end

    event :assign do
      transition new: :assigned
    end

    event :do do
      transition [:assigned, :rejected] => :doing
    end

    event :testing do
      transition [:doing, :rejected] => :testing
    end

    event :reject do
      transition testing: :rejected
    end

    event :accept do
      transition testing: :accepted
    end
  end

  def overdue?
    Time.zone.parse(due_date.to_s) < Time.zone.now
  end

  def check_assigned
    !assigned_user_id.nil?
  end
end
