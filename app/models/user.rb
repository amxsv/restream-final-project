require 'digest/sha2'

class User < ActiveRecord::Base
  enum role: { worker: 1, manager: 2 }
  attr_accessor :password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, email: true

  validates_length_of :password, minimum: 6, :on => :create

  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
    if password.present?
      self.password_hash = Digest::SHA2.hexdigest(password)
    end
  end

  def check_password?(password)
    return password_hash == Digest::SHA2.hexdigest(password) if password
    false
  end

  def clear_password
    self.password = nil
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.check_password?(password)
      return user
    end
    false
  end
end
