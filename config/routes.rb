Rails.application.routes.draw do
  resources :titles

# get "/titles" => "titles#index"

  resources :will_applies

  resources :users

  resources :sessions
  
  
end 
