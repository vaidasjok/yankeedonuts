class UserMailer < ApplicationMailer
  default to: 'info@svetainiuekspertai.lt, info@yankeedonuts.ie', from: 'info@yankeedonuts.co.uk'


  def user_mail(first_name, last_name, email, subject, message)
  	@first_name = first_name
  	@last_name = last_name
    @email = email
    @subject = subject
    @message = message
    mail(from: 'info@yankeedonuts.co.uk', subject: subject)
  end
end
