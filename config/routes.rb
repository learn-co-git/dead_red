Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :comments
    end
  end

  put 'buy', action: :update, controller: 'api/v1/cards' 
  get 'market', action: :index, controller: 'api/v1/cards'
  post 'new', action: :make_new, controller: 'api/v1/users'
  post 'login', action: :create, controller: 'api/v1/sessions'
  get 'current', action: :get_current_user, controller: 'api/v1/sessions'
  post 'logout', action: :destroy, controller: 'api/v1/sessions'
  get 'collection', action: :collection, controller: 'api/v1/cards'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
