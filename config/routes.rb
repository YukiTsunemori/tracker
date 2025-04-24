Rails.application.routes.draw do
  # staticpages controller
  root "static_pages#home"
  get    "/home",    to: 'static_pages#home'
  get    "/about",   to: "static_pages#about"
  get    "/contact", to: "static_pages#contact"
  get    "/howto",   to: "static_pages#howto"

  # users controller
  get    "/signup",  to: "users#new"
  resources :users
  
  # sessions controller
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"

  # workspaces contoroller
  get    "/index",    to: "workspaces#index"
  resources :workspaces, except: [:index]
  
  # posts controller
  resources :posts
  resources :reply_messages

end
