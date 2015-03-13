Rails.application.routes.draw do
  root to: 'home#index'

  resources :shortened_urls, only: [:index, :new, :create]
end
