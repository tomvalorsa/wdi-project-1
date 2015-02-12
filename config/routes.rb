Rails.application.routes.draw do
  root :to => 'images#index'
  get '/about' => 'pages#about'

  get '/search' => 'posts#search'

  resources :users, :posts, :images
  resources :libraries, :only => [:show]
  resources :comments, :only => [:new, :create, :destroy]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  post '/posts/:id/add_to_library' => 'libraries#add'
  # removing while browsing posts
  post '/posts/:id/remove_from_library' => 'libraries#remove'

  get '/library/posts/:id' => 'libraries#show_post'
  # removing from the library instance
  post '/library/posts/:id/remove_from_library' => 'libraries#remove_from_lib'

  post '/images/:id/add_to_library' => 'libraries#add_image'
  post '/images/:id/remove_from_library' =>  'libraries#remove_image'
  get '/library/images/:id' =>  'libraries#show_image'
  post '/library/images/:id/remove_from_library' => 'libraries#remove_image_from_lib'
end
