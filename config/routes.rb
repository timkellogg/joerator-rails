Rails.application.routes.draw do

  root 'static_pages#home'

  get 'highest' => 'coffeeshops#highest'

  # adds favorite
  post 'coffeeshops/:id/favorite' => 'coffeeshops#favorite'

  resources :coffeeshops do
    resources :reviews
  end

  resources :coffeeshops do
    resources :menus
  end

  resources :menus do
    resources :items, except: [:show, :index]
  end

  get     'signup'    => 'users#new'
  get     'login'     => 'sessions#new'
  post    'login'     => 'sessions#create'
  delete  'logout'    => 'sessions#destroy'

  get     'dashboard' => 'users#dashboard'

  resources :users
end
