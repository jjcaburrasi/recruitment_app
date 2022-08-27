Rails.application.routes.draw do

  resources :offers
  devise_for :users
  root 'static_pages#home'
<<<<<<< Updated upstream
  get  '/kanban',     to: 'jobs#kanban' ##modificarrrrr
  get  '/promote',    to: 'applications#promote' ##modificarrrrr
  get  '/unpromote',  to: 'applications#go_back_promote' #modificat tambieeeeeen
  get  '/reject',     to: 'applications#reject' #modificat tambieeeeeen
  get  '/help',       to: 'static_pages#help'
  get  '/about',      to: 'static_pages#about'
  get  '/jobs',       to: 'jobs#index'
=======
  get  '/kanban',   to: 'jobs#kanban'
  get  '/promote',   to: 'applications#promote'
  get  '/unpromote', to: 'applications#go_back_promote' 
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/jobs',    to: 'jobs#index'
>>>>>>> Stashed changes
  resources :users
  resources :jobs
  resources :applications
  resources :stages

  resources :comments, only: [:create, :destroy]
  resources :stages, only: [:create, :destroy]
end
