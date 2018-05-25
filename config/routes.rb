Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#new'
  resources :tweets
  get '/login', to: 'sessions#new'
  get '/auth/twitter/callback', to: 'sessions#create'
end
