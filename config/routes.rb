Rails.application.routes.draw do
  resources :my_verses
  
  get '/auth/facebook/callback' => 'sessions#fb_login'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :verse_references, only: :index do
    resources :my_verses, only: [:index]
  end

  get '/signup', to: 'users#new'
  resources :users, except: [:index, :new]

  root 'static#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
