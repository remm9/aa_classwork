Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/users', to: 'users#index' 
  # get '/users/new', to: 'users#new' 
  # post '/users', to: 'users#create'
  # get '/users/:id', to: 'users#show'
  # patch '/users/:id', to: 'users#update'
  # get '/users/:id/edit', to: 'users#edit'
  # put '/users/:id', to: 'users#update'  
  # delete '/users/:id', to: 'users#destroy'
    
  resources :users, only: [:show, :create, :update, :destroy] do
    resources :artworks, only: [:index]
  end
  resources :artworks, only: [:index, :show, :create, :update, :destroy]
  resources :artwork_shares, only: [:index, :create, :destroy]
  


end
