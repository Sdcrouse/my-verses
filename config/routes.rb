Rails.application.routes.draw do
  resources :verse_references
  resources :users
  # Next steps: Homepage, User sign up, login, and logout

  root 'static#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
