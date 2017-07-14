class UserMailer < ApplicationMailer
  default to: 'info@svetainiuekspertai.lt, vytautas@plumbing.lt', from: 'vytautas@plumbing.lt'


  def user_mail(email, phone, subject, message)
    @email = email
    @phone = phone
    @subject = subject
    @message = message
    mail(from: 'vytautas@plumbing.lt', subject: subject)
  end
end
