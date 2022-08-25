Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/jobs',    to: 'jobs#index'
  resources :users
  resources :jobs
  resources :applications

  resources :comments, only: [:create, :destroy]
  resources :stages, only: [:create, :destroy]
end
