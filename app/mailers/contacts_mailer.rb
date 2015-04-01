class ContactsMailer < MandrillMailer::MessageMailer
	default from: 'info@guybilze.com'

	def welcome_email(contact)

		mandrill_mail(
				text: "Wecome to Guybilze",
				subject: "Welcome #{contact.name || contact.email}!",
				to: contact.email,
		)
	end
end