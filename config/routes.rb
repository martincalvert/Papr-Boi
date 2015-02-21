Rails.application.routes.draw do
  root 'revolver#index'

  #User Access Flow Controlls
  get 'revolver/login'
  get 'revolver/logout'
  get 'revolver/index'
  get 'revolver/welcome'

  #User Management
  get 'users/index'
  get 'users/new'
  get 'users/edit', to: 'users#edit'
  get 'users/edit/:id', to: 'users#edit'
  post 'users/update', to: 'users#update'
  post 'users/create', to: 'users#create'

  #Email Builder
  get 'builder/new_email'
  get 'builder/build'
end
