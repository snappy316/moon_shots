Rails.application.routes.draw do
  resources :barrels
  resources :satellites
  post '/satellites', to: 'satellites#create', as: :create_satellite

  get '/parser', to: 'pages#parser'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
