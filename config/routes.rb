Rails.application.routes.draw do

  #get '/users/:id', to: 'users#show', as: 'user'
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :blog_posts do
    resources :comments, only: [:create] do
      post 'reply', on: :member
    end
  end

  resources :users, only: [:show, :index] do
    member do
      post 'follow', to: 'users#follow', as: 'follow'
      post 'unfollow', to: 'users#unfollow', as: 'unfollow'
    end
    

  end

  resource :user_profile, only: [:show], path: 'users', controller: 'user_profile'

  get '/search/users', to: 'search#search_users', as: 'search_users'


  get '/settings', to: 'settings#index', as: 'settings'


  


  # Defines the root path route ("/")
   root "blog_posts#index"
end
