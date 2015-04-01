class Api::V1::UsersController < ApiController

	before_action :get_user, only: [:update, :destroy, :show]

	def create
		@user = User.new(user_params)

		if @user.save
			render 'user', status: :created
		else
			render 'error_json', status: :unprocessable_entity
		end
	end

	def update
		if @user.try(:update_attributes, user_params)
			render 'user'
		else
			render 'error_json', status: :unprocessable_entity
		end
	end

	def show
		if @user
			render 'user'
		else
			render 'error_json', status: :unprocessable_entity
		end
	end

	def destroy
		if @user.try(:destroy)
			render :nothing => true, status: :ok
		else
			render 'error_json', status: :unprocessable_entity
		end
	end

	private

	def user_params
		params.permit(:name, :email, :password)
	end

	def get_user
		@user = User.find_by_id params[:id]
	end

end