Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tasks#index"

  resources :tasks do
    post "toggle_status_state", as:"toggle_status", on: :member
  end #, only: [:index, :create, :update]
end
