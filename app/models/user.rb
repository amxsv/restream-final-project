require 'securerandom'

class User < ActiveRecord::Base
  enum role: { worker: 1, manager: 2 }

  has_secure_password

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :email, presence: true, uniqueness: true, email: true

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
end
