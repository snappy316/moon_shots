Rails.application.routes.draw do
  post '/satellites', to: 'satellites#create', as: :create_satellite
  patch '/satellites/parse', to: 'satellites#parse', as: :satellite_parse

  resources :satellites do
    resources :barrels
  end

  get '/parser', to: 'pages#parser'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
