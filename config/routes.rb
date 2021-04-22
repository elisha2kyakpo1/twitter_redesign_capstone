Rails.application.routes.draw do
  resources :sessions, only: %i[new create logout_user]
    get 'logout', to: 'sessions#logout_user'

  resources :users do
    post '/users/', to: 'users#index'
    put '/users/', to: 'users#create'
    get '/users/:id', to: 'users#show'
    get 'delete', to: 'users#destroy'
    member do
      get '/follow/', to: 'users#follow_user'
      get '/unfollow/', to: 'users#unfollow_user'
    end
  end
  resources :tweets do
    post '/tweet/', to: 'tweet#index'
    put '/tweet/', to: 'tweet#create'
    get '/tweet/:id', to: 'tweet#show'
    resources :votes, only: %i[vote unvote] 
      get 'vote', to: 'votes#vote' 
      get 'unvote', to: 'votes#unvote' 
  end
  root to: 'tweets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
