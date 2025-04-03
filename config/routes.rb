Rails.application.routes.draw do
  root "static_pages#home"
  get '/home', to: 'static_pages#home'
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/howto", to: "static_pages#howto"
  get "/signup", to: "users#new"
  
  get "up" => "rails/health#show", as: :rails_health_check

end
