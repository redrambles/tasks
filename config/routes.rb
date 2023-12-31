Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tasks#index"

  resources :tasks do
    post "mark_task_as_done", as: "complete", on: :member
    collection do
      get "export_csv"
      get "export_csv_form"
    end
  end
end
