Rails.application.routes.draw do
  resources :vehicles
  resources :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :users do
        post :login
        post :create
        get :profile
        delete :logout
      end
      namespace :vehicles do
        get :index
        get :show
        post :create
        patch :update
        delete :destroy
        get :get_upload_credentials
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
