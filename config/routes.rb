Rails.application.routes.draw do
  resources :memberships, only: [:create]
  resources :clients, only: %i[show index update]
  resources :gyms, only: %i[show delete index update]
end
