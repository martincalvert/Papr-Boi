Rails.application.routes.draw do
  root 'revolver#index'

  get 'user/index'

  get 'user/new'

  get 'user/create'

  get 'user/edit'

  get 'user/update'

  get 'user/delete'

  get 'user/destroy'

  get 'revolver/login'

  get 'revolver/logout'

  get 'revolver/index'

  get 'revolver/welcome'
end
