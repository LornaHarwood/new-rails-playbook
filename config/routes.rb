Rails.application.routes.draw do
  resources :pages
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  get "signup", to: "users#new", as: "signup"
  get "signin", to: "sessions#new", as: "signin"
  get "signout", to: "sessions#destroy", as: "signout"
end
