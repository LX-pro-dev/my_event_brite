Rails.application.routes.draw do
  get 'static_pages_controller/index'
  get 'static_pages_controller/secret'
  devise_for :users
  resources :attendances
  resources :events
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "event#index"
end
