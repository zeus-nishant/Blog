Rails.application.routes.draw do
  get 'user_profile/show'
  devise_for :users #controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :blog_posts

  resources :users, only: [:show] do
    member do
      post :follow # Add the follow action route
    end
  end

  get '/search/users', to: 'search#search_users', as: 'search_users'
  get 'users/:id', to: 'user_profile#show', as: 'user_profile'


  # Defines the root path route ("/")
   root "blog_posts#index"
end
