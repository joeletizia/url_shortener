Rails.application.routes.draw do
  root to: 'home#index'

  resources :shortened_urls, only: [:index, :new, :create]

  get '/:id', to: 'redirection#show', as: 'redirection'
end
