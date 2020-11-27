Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/profile', to: 'users#profile'
  get '/todo', to: 'users#todo'
  resources :users, only: :update
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :search_parties, only: [:new, :create, :show, :edit, :update] do
    resources :search_party_attendancies, only: [:index, :show]
  end
  resources :chatrooms, only: [] do
    resources :messages, only: :create
  end
  resources :lost_people do
    resources :search_parties, only: :index
    resources :search_party_attendancies, only: :create
    resources :chatrooms, only: [:show, :index, :create]
    resources :feed_infos, only: [:index, :create]
  end
  resources :search_party_attendancies, only: [:show, :create, :update] do
    member do
      resources :user, only: :update
    end
  end
  get '/join_search', to: 'pages#join_search'
end
