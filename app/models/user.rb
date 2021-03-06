require 'securerandom'

class User < ActiveRecord::Base
  extend Enumerize

  enumerize :role, in: [:worker, :manager], default: :worker, scope: true
  has_many :tasks

  has_secure_password

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :email, uniqueness: true, email: true

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
end
