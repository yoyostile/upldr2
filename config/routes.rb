Rails.application.routes.draw do
  root 'uploads#new'

  resources :uploads, path: 'u' do
    member do
      get 'destroy', as: :destroy
    end
  end
  get '/u/:id/:version', to: 'uploads#show'
  resources :tokens, only: [:index]

  resources :albums
end
