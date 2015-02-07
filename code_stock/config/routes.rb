Rails.application.routes.draw do
  get 'users/index'

  get 'users/create'

  get 'users/new'

  root :to => 'pages#home'

  resources :users, :only => [:new, :create, :index]
end
