Rails.application.routes.draw do
  get 'applications/new'
  get 'applications/create'
  devise_for :users
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/jobs',    to: 'jobs#index'
  resources :users
  resources :jobs
  resources :applications, only: [:create, :destroy]
end
