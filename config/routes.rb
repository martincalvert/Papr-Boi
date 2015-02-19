Rails.application.routes.draw do
  root 'revolver#index'

  #User Access Flow Controlls
  get 'revolver/login'
  get 'revolver/logout'
  get 'revolver/index'
  get 'revolver/welcome'

  #User Management
  get 'user/index'
  get 'user/new'
  get 'user/edit'
  get 'user/delete'

  #Email Builder
  get 'builder/new_email'
  get 'builder/build'
end
