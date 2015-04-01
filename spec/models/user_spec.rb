require 'rails_helper'

RSpec.describe User, type: :model do

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password) }

	it { should validate_presence_of(:password) }
	it { should validate_presence_of(:email) }


end
