Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'localize#index'
  get 'timeline' => 'timeline#index'

  get 'signup' => 'signup#new'
  post 'signup' => 'signup#create'
  
  get 'login' => 'login#new'
  post 'login' => 'login#create'
  get 'login/logout' => 'login#logout',as: :login_logout
end
