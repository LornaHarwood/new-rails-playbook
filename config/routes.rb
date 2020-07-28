Rails.application.routes.draw do
  resources :pages
  resources :users, only: [:new, :create, :show]
end
