Rails.application.routes.draw do
  get 'searches/search'
  root 'homes#top'
  devise_for :users
  get 'users' => "users#index", as: 'users'

  get 'home/about' => "homes#about", as: 'about'

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  
  end
    
  resources :users, only: [:show, :edit, :update] do
    
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  get 'search' => "searches#search"
  
  resources :messages, only: [:create]
  resources :rooms, only:  [:create, :show]
  
end
