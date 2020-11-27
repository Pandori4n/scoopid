Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/profile', to: 'users#profile'
  resources :users, only: :update
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :search_parties, only: [:new, :create] do
    resources :search_party_attendancies, only: [:index]
  end
  resources :lost_people do
    resources :search_party_attendancies, only: :create
  end
  resources :search_party_attendancies, only: [:show, :create, :update] do
    member do
      resources :user, only: :update
    end
  end
  get '/join_search', to: 'pages#join_search'
end
