Rails.application.routes.draw do
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
end
