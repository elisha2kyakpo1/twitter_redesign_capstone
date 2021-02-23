Rails.application.routes.draw do
  resources :sessions, only: %i[new create logout_user]
    get 'logout', to: 'sessions#logout_user'

  resources :users do
    post '/users/:id', to: 'users#index'
    put '/users/:id', to: 'users#create'
    get '/users/:id', to: 'users#show'
    member do
      get '/follow/', to: 'users#follow_user'
      get '/unfollow/', to: 'users#unfollow_user'
    end
  end
  resources :tweets, only: %i[index new create show]
    resources :votes, only: %i[vote unvote]
    get 'unvote', to: 'votes#vote' 
    get 'unvote', to: 'votes#unvote' 
  root to: 'tweets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
