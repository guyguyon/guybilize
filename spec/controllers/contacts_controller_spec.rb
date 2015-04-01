require 'rails_helper'

RSpec.describe Api::V1::ContactsController, :type => :controller do
	render_views

	let(:user) { create(:user) }

	def contact_params
		{email: 'a@a.com', user_id: user.id, name: 'Foo'}
	end

	describe 'POST #create' do
		it 'responds successfully with an HTTP 201 status code' do
			expect {
				post :create, contact_params
			}.to change(Contact, :count).by(1)
			expect(response).to have_http_status(201)
			expect(response).to render_template('contact')
			response_compare_keys(response, :email, :user_id, :name)
		end

		it 'fails with an HTTP 422 status code' do
			expect {
				post :create, contact_params.merge({user_id: user.id + 1})
			}.to change(Contact, :count).by(0)
			expect(response).to have_http_status(422)
			expect(response).to render_template('error_json')
			response_compare_keys(response, :success, :messages)
		end

	end

	describe 'GET #index' do

		let(:contacts) { create_list(:contact, 25) }

		it 'responds successfully with an HTTP 200 status code' do
			get :index, user_id: user.id
			expect(response).to have_http_status(200)
			expect(response).to render_template('contacts')
		end

	end
end