Rails.application.routes.draw do

  get 'visible_groups/index'

  get 'visible_groups/edit'

  get 'visible_groups/new'

  root 'revolver#index'

  #User Access Flow Controlls
  get 'revolver/login'
  get 'revolver/logout'
  get 'revolver/index'
  get 'revolver/welcome'

  #User Management
  get 'users/index'
  get 'users/new'
  get 'users/edit/:id', to: 'users#edit'
  get 'users/destroy'
  post 'users/update', to: 'users#update'
  post 'users/create', to: 'users#create'

  #CSS Management
  get 'styles/index'
  get 'styles/new'
  get 'styles/edit/:id', to: 'styles#edit'
  get 'styles/destroy/:id', to: 'styles#destroy'
  post 'styles/update', to: 'styles#update'
  post 'styles/create', to: 'styles#create'

  #Modules Management
  get 'sections/index'
  get 'sections/edit/:id', to: 'sections#edit'
  get 'sections/new'
  get 'sections/destroy/:id', to: 'sections#destroy'
  post 'sections/update'
  post 'sections/create'

  #Email Builder
  get 'builder/new', to: 'builder#new_email'
  get 'builder/build'
  get 'builder/to_file'
end
