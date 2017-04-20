Rails.application.routes.draw do
  scope :api do
    get 'search_properties', to: 'zoopla#search_properties'
    get 'user_properties', to: 'zoopla#user_properties'
    resources :houses
    resources :users, except: [:create]
    post 'register', to: 'authentications#register'
    post 'login', to: 'authentications#login'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
