Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :new, :show, :create] 
  resource :session, only: [:new, :create, :destroy]
  resources :subs do 
    resources :posts, only: [:new, :create]
  end
  resources :posts, only: [:show, :destroy, :edit, :update]
end
