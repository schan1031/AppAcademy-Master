Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resource :session, only: [:create, :destroy, :new]

  resources :bands
  resources :albums, only: [:new, :create, :edit, :show, :update, :destroy] do
    resource :track, only: [:new]
  end
  resources :tracks, only: [:create, :edit, :show, :update, :destroy]

end
