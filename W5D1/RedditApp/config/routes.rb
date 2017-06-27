Rails.application.routes.draw do
  get 'posts/new'

  get 'posts/edit'

  get 'posts/show'

  # get 'subs/index'
  #
  # get 'subs/new'
  #
  # get 'subs/edit'
  #
  # get 'subs/show'

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :subs
  resources :posts, except: [:index]

  resources :comments, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
