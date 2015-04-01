FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "user_#{n}" }
		sequence(:email) { |n| "email#{n}@factory.com" }
		password 'password'

	end
end