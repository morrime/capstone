Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  post 'unfollow', to: 'home#unfollow'
  post 'follow', to: 'home#follow'
  root to: 'home#show'
  get 'faqs', to: 'faqs#show', as: 'faqs'

end
