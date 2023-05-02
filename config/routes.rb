Rails.application.routes.draw do
  resources :titles

  resources :will_applies

  post "/users" => "users#create"

  post "/sessions" => "sessions#create"
  
end
