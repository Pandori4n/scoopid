Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/profile', to: 'users#profile'
  resources :users, only: :update

  resources :lost_people
end
