Rails.application.routes.draw do
  root 'static_pages#home'

  get 'signup' => 'users#new'
  resources :users
end