Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :todos, except: [:edit, :new], defaults: {format: :json}
  end

  root "static_pages#root"
end
