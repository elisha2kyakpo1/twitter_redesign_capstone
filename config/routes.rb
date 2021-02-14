Rails.application.routes.draw do
  resources :sessions
  delete 'logout' => 'sessions#destroy'
  resources :users do
    get 'show/:id' => 'user#show'
    collection do
      get 'follow'
      get 'unfollow'
      get 'followers'
      get 'following'
    end
  end
  resources :tweets
  root to: 'tweets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
