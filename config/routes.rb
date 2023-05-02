Rails.application.routes.draw do
  resources :titles

  resources :will_applies

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  get "/logout" => "sessions#destroy"
  post "/sessions" => "sessions#create"

  

end

