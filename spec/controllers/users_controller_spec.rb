require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do
	render_views

	def user_params
		{name: 'Bla', email: 'yo@yoho.com', password: '123'}
	end

	describe 'GET #show' do
		let(:user) { create(:user) }

		it 'responds undefine user with an HTTP 422 status code' do
			get :show, id: user.id - 1
			expect(response).to have_http_status(422)
			expect(response).to render_template('error_json')
		end


		it 'responds successfully with an HTTP 200 status code' do
			get :show, id: user.id
			expect(response).to have_http_status(200)
			expect(response).to render_template('user')
			response_compare_keys(response, :email, :name)
		end

	end

	describe 'POST #create' do
		it 'responds successfully with an HTTP 201 status code' do
			expect{
				post :create, user_params
			}.to change(User, :count).by(1)
			expect(response).to have_http_status(201)
			expect(response).to render_template('user')
			response_compare_keys(response, :email, :name)
		end
	end

	describe 'PUT #update' do
		let(:user) { create(:user) }

		it 'responds successfully with an HTTP 200 status code' do
			get :update, user_params.merge({name: 'Guy Guy', id: user.id})
			expect(response).to have_http_status(200)
			expect(response).to render_template('user')
			expect(User.first.name).to eq('Guy Guy')
			response_compare_keys(response, :email, :name)
		end
	end

	describe 'DELETE #destroy' do

		it 'responds successfully with an HTTP 200 status code' do
			expect{
				post :create, user_params
			}.to change(User, :count).by(1)

			expect{
				delete :destroy, :id => User.first
			}.to change(User, :count).by(-1)
			expect(response).to have_http_status(200)
		end
	end

end