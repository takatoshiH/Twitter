Rails.application.routes.draw do
  root "tweets#index"
  devise_for :users
  resources :tweets, only: [:index, :show, :new, :create] 
  resources :users do
    resources :tweets do
      resources :likes
    end
  end

  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships,  only: [:create, :destroy]

end
