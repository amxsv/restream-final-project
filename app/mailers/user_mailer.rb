class UserMailer < ApplicationMailer
  def confirm_email(user)
    @user = user
    mail to: @user.email, subject: 'Welcome to Task Manager. Confirm email.'
  end
end
