Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :cards
      resources :users
      resources :comments
    end
  end

  post 'login', action: :create, controller: 'api/v1/sessions'
  get 'current', action: :current_user, controller: 'application'
  delete 'logout', action: :destroy, controller: 'api/v1/sessions'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
