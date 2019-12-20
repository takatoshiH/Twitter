Rails.application.routes.draw do
  root "tweets#index"
  devise_for :users
  resources :tweets, only: [:index, :show, :new, :create] 
  resources :user do
    resources :tweets
  end
end
