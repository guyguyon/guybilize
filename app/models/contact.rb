class Contact < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :user
	validates_presence_of :email
	validates_uniqueness_of :email

	#after_create :send_welcome_email

	def send_welcome_email
		raise 'failed sending welcome email' unless Rails.env.test? or ContactsMailer.welcome_email(self).deliver
	end



	def self.mass_insert(attributes, contacts_data)
		MassActions.insert(self.table_name, attributes, contacts_data)
	end


end


