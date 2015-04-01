FactoryGirl.define do
	factory :contact do
		association :user, factory: :user
		sequence(:email) { |n| "jimi_#{n}@hendrix.com" }
		name 'Jimi Hendrix'
	end
end