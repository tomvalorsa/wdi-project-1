Rails.application.routes.draw do
  root :to => 'pages#home'

  resources :users, :posts
  # change below to only certain resources (e.g. can't delete a library)
  resources :libraries

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  # get '/profile' => 'users#profile'
  # post '/profile' => 'users#profile_edit'

  # get '/users/:id/profile' => 'users#show'

end
