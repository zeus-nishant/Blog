Rails.application.routes.draw do

  #get '/users/:id', to: 'users#show', as: 'user'
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :blog_posts

  resources :users, only: [:show, :index] do
    member do
      post :follow # Add the follow action route
    end
    

  end

  resource :user_profile, only: [:show], path: 'users', controller: 'user_profile'

  get '/search/users', to: 'search#search_users', as: 'search_users'


  

  


  # Defines the root path route ("/")
   root "blog_posts#index"
end
