Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  get 'users' => "users#index", as: 'users'

  get 'home/about' => "homes#about", as: 'about'

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :destroy, :update, :edit]
  resources :users, only: [:show, :edit, :update]
end
