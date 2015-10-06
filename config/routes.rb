Rails.application.routes.draw do
	root :to      => 'static_pages#home'

  get     'signup' => 'users#new'
  get     'login'  => 'sessions#new' 
  post    'login'  => 'sessions#create'
  delete  'logout' => 'sessions#destroy'

  get      'dashboard' => 'users#dashboard'

  resources :users
end


