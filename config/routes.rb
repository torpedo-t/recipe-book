Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'
  get '/auth/github/callback', to: 'sessions#create'
  get '/signin' => 'sessions#new', as: 'sign_in'
  post '/signin' => 'sessions#create', as: 'signin_post'
  get '/logout' => 'sessions#destroy', as: 'logout'
  get "/recipes/most_recent" => 'recipes#most_recent', as: 'recent_recipes'
  post "/recipes/:recipe_id/ratings/new" => 'ratings#create', as: 'post_new_recipe_rating'
  
  resources :users, only: [:show]

  resources :recipes, only: [:index]

  resources :users do
    resources :recipes, only: [:new, :create, :index, :show]
  end

  resources :recipes do
    resources :ratings, only: [:new, :create]
  end

  resources :categories do
    resources :recipes, only: [:index, :show]
  end

  root 'static#home'
end
