class User < ActiveRecord::Base
	has_many :contacts

	validates_presence_of :email
	validates_presence_of :password


end
