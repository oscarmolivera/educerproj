class UserMailer < ApplicationMailer
  def password_reset(user)
    @user = user
    mail to: user.email, subject: t('user_mailer.password_resets.subject')
  end
end
