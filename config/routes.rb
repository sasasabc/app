Rails.application.routes.draw do

  get 'favorites/create'

  get 'favorites/destroy'

  devise_for :users
  root 'posts#index'

  resources :users, only: [:show, :index] do
    resources :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    get :favorites, on: :member
  end
  
  get 'relationships/create'

  get 'relationships/destroy'

  get 'home/show' => 'home#show', as: 'home'
  get 'home/about' => 'home#about',as: 'home_about'


  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
