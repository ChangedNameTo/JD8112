Rails.application.routes.draw do

  # Authentication
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: [:create, :destroy]

  # Homepages
  root 'home#logged_in'
  get 'authenticate', to: 'home#logged_out'
  resource :home, only: [:logged_in, :logged_out]

  # Users
  resources :users

  # Roles
  resources :roles

  # UserRoles
  resources :user_roles

  # Projects
  resources :projects
  resources :project_comments

  # Settings
  resources :expo_settings
end
