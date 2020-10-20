Rails.application.routes.draw do
  namespace :api do
    resources :users
    resources :users do 
      resources :schedules
    end 
    resources :users do
      resources :goals
    end 
  end 
end
