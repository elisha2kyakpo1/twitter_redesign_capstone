Rails.application.routes.draw do
  resources :sessions
  delete 'logout' => 'sessions#destroy'
  resources :users do
    member do
      get 'follow_user'
      delete 'unfollow_user' => 'users#unfollow_user'
    end
  end
  resources :tweets
  root to: 'tweets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
