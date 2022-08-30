Rails.application.routes.draw do

  resources :offers
  devise_for :users
  root 'static_pages#home'
  get  '/kanban',     to: 'jobs#kanban'
  get  '/promote',    to: 'applications#promote' 
  get  '/unpromote',  to: 'applications#go_back_promote' 
  get  '/reject',     to: 'applications#reject' 
  get  '/about',      to: 'static_pages#about'
  get  '/jobs',       to: 'jobs#index'
  get  '/publish',    to: 'jobs#publish'
  get  '/send_offer', to: 'offers#send_offer'
  resources :users
  resources :jobs
  resources :applications
  resources :stages

  resources :comments, only: [:create, :destroy]
  resources :stages, only: [:create, :destroy]
end
