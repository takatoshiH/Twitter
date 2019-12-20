Rails.application.routes.draw do
  root "tweets#index"
  devise_for :users
  resources :tweets, only: [:index, :show, :new, :create] 
  resources :users do
    resources :tweets
  end
end
