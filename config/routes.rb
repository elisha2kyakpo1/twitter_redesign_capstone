Rails.application.routes.draw do
  resources :sessions, only: %i[new create logout_user]
    get 'logout', to: 'sessions#logout_user'

  resources :users do
    member do
      get 'follow_user'
      get 'unfollow_user' => 'users#unfollow_user'
    end
  end
  resources :tweets
  root to: 'tweets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
