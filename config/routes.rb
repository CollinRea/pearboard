Rails.application.routes.draw do

  root to: "users#index"

  resources :users, { :except => :delete }
  resources :slots

  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy", :via => :delete

end
