Rails.application.routes.draw do
  get "/my_verses/new", to: "verse_references#new", as: "new_my_verse"
  # Note: I'm setting my routes up this way so that I can use #accepts_nested_attributes_for on the VerseReference model.
  resources :my_verses, except: [:new, :create]
  
  get '/auth/facebook/callback' => 'sessions#fb_login'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :verse_references, only: [:index, :create]

  get '/signup', to: 'users#new'
  resources :users, except: [:index, :new]

  root 'static#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
