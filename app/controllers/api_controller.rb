class ApiController < ApplicationController
	before_action :authenticate_user

	def authenticate_user
		# do something
	end

end
