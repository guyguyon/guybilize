class Api::V1::ContactsController < ApiController

	def index
		@contacts = Contact.where(index_params)
		render 'contacts'
	end

	def create
		@contact = Contact.new(contact_params)

		if @contact.save
			render 'contact', status: :created
		else
			render 'error_json', status: :unprocessable_entity
		end
	end


	private

	def index_params
		params.permit(:user_id)
	end

	def contact_params
		params.permit(:email,:name, :user_id)
	end

end