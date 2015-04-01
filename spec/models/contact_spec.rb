require 'rails_helper'

RSpec.describe Contact, type: :model do

	it { should respond_to(:user_id) }
	it { should respond_to(:name) }
	it { should respond_to(:email) }

	it { should validate_presence_of(:user) }
	it { should validate_presence_of(:email) }

end
