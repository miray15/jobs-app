Rails.application.routes.draw do
  root "users#home" 

  
  resources :titles


  resources :will_applies

  resources :users
  get "/signup" => "users#new"
  get "/users" => "users#show"
  post "/users" => "users#create"
 

  get "/login" => "sessions#new"
  post "sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"

  resources :sessions

  
  
end 
