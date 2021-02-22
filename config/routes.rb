Rails.application.routes.draw do
  resources :sessions, only: %i[new create logout_user]
    get 'logout', to: 'sessions#logout_user'

  resources :users do
    post '/users/:id', to: 'users#index'
    put '/users/:id', to: 'users#create'
    get '/users/:id', to: 'users#show'
    # member do
    #   get '/follow/', to: 'users#follow_user'
    #   get '/unfollow/', to: 'users#unfollow_user'
    # end
  end

  resources :followers, only: %i[index follow_user unfollow_user]
  get '/follow/', to: 'followings#follow'
  get '/unfollow/', to: 'followings#unfollow'

  resources :tweets, only: %i[index new create show]
  get '/tweets', to: 'tweets#index'
  get '/tweets/new', to: 'tweets#new'
  get '/tweets/:id', to: 'tweets#show'
  root to: 'tweets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
