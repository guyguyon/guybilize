Rails.application.routes.draw do

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

	namespace :api do
		namespace :v1 do
			resources :users, only: [:create, :show, :destroy, :update] do
				resources :contacts, only: [:index, :create]
			end
		end
	end

end
