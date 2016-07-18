require 'securerandom'

class User < ActiveRecord::Base
  extend Enumerize

  enumerize :role, in: [:worker, :manager], default: :worker, scope: true
  has_many :tasks, foreign_key: 'assigned_user_id'

  has_secure_password

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :email, uniqueness: true, email: true

  scope :workers, -> { with_role(:worker) }

  state_machine :state, initial: :unconfirmed do
    event :confirm do
      transition unconfirmed: :confirmed
    end
  end

  def send_confirmation_token
    return unless unconfirmed?

    update confirmation_token: SecureRandom.hex
    UserMailer.confirm_email(self).deliver_later
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def tasks_count
    Task.where(assigned_user: id).count
  end

  def self.tasks_count
    users = select('users.id, count(*) as count')
            .joins(:tasks)
            .group(:id)
            .all

    result = []
    users.each do |u|
      result[u.id] = u.count
    end
    result
  end
end
