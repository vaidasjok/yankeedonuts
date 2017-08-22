class EventMailer < ApplicationMailer
	default to: 'info@yankeedonuts.ie', from: 'info@yankeedonuts.co.uk'


	def event_mail(name, phone, email, date, time, comments)
		@name = name
		@phone = phone
		@email = email
		@date = date
		@time = time
		@comments = comments
		mail(from: 'events@yankeedonuts.co.uk', subject: "Event")
	end
end
