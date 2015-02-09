Rails.application.routes.draw do
  root :to => 'pages#home'

  get '/about' => 'pages#about'

  get '/dev_log' => 'pages#dev_log'

  resources :users, :posts
  # change below to only certain resources (e.g. can't delete a library)
  resources :libraries

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  post '/posts/:id/add_to_library' => 'libraries#add'
  # removing while browsing posts
  post '/posts/:id/remove_from_library' => 'libraries#remove'

  get '/library/posts/:id' => 'libraries#show_post'
  # removing from the library instance
  post '/library/posts/:id/remove_from_library' => 'libraries#remove_from_lib'
end
