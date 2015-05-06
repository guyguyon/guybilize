class Api::V1::ContactsController < ApiController

	def index
		@contacts = Contact.where(index_params)
		render 'contacts'
	end

	def create
		c_params = contacts_params
		user_id = c_params[:user_id]
		contacts_data = []
		emails = []
		c_params[:contacts].each do |contact_params|
			contacts_data << contact_params.to_hash.symbolize_keys.merge({user_id: user_id})
			emails << contact_params[:email]
		end

		@messages = []
		@messages << ['There are duplicate emails on list'] unless emails.size == emails.uniq.size
		@messages << ['Undefined user'] unless User.exists?(user_id)

		if @messages.empty? && Contact.mass_insert([:email,:name, :user_id],contacts_data)

			render 'success_json', status: :created
		else
			render 'error_json', status: :unprocessable_entity
		end
	end


	private

	def index_params
		params.permit(:user_id)
	end

	def contacts_params
		params.permit(:user_id,:contacts => [:email,:name])
	end

end