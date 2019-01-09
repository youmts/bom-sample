Rails.application.routes.draw do
  root to: 'home#index'

  resources :nodes, only: [:index, :show]
end
